import 'package:azblob/azblob.dart';
import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

part 'products_screen_cubit.freezed.dart';

const pageSize = 8;

class ProductsScreenCubit extends Cubit<ProductsScreenState> {
  ProductsScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductsScreenStateReady());

  final CQRS _cqrs;
  final _logger = Logger('ProductsScreenCubit');

  Future<void> fetch({int page = 0}) async {
    final state = this.state;

    if (state is! ProductsScreenStateReady) {
      return;
    }

    if (page != 0) {
      if (page < 0 || page >= (state.totalCount - 1) / pageSize) {
        return;
      }
    }

    try {
      final result = await _cqrs.get(
        GetAllProducts(
          pageNumber: page,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
        ),
      );

      emit(
        state.copyWith(
          currentPage: page,
          totalCount: result.totalCount,
          products: {
            ...state.products,
            page: result.items,
          },
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        ProductsScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null && result.count == 1) {
      emit(ProductsScreenState.ready(
        currentFile: result.files.first,
      ));
    }
  }

  Future<void> uploadFile() async {
    final state = this.state;
    if (state is! ProductsScreenStateReady) {
      return;
    }

    try {
      final currentFile = state.currentFile;

      if (currentFile != null) {
        final result = await _cqrs.get(GetPhotoUploadLink(
          blobName: currentFile.name,
        ));

        final contentType = p.extension(currentFile.name).replaceAll('.', '');

        var storage = AzureStorage.parse(
            'DefaultEndpointsProtocol=https;AccountName=furnitureshopstorage;AccountKey=6SRIXCdjvPICeOpofs4bKBTpEz+Wkgxkrp2Hv4wob/t+gLu+3qll4IYB/emr6AyiqfYK3KCqmYqM+AStRi2ouw==;EndpointSuffix=core.windows.net');

        await storage.putBlob(
          '/images/$result',
          bodyBytes: currentFile.bytes,
          contentType: contentType,
          type: BlobType.BlockBlob,
        );
      }
    } catch (err, st) {
      _logger.severe(err, st);
      emit(ProductsScreenState.error(error: err.toString()));
    }
  }
}

@freezed
class ProductsScreenState with _$ProductsScreenState {
  const factory ProductsScreenState.ready({
    @Default(<int, List<ProductDTO>>{}) Map<int, List<ProductDTO>> products,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
    PlatformFile? currentFile,
  }) = ProductsScreenStateReady;
  const factory ProductsScreenState.error({
    required String error,
  }) = ProductsScreenStateError;
}

extension ProductsScreenStateReadyEx on ProductsScreenStateReady {
  List<ProductDTO> get currentPageProducts => products[currentPage] ?? [];
}
