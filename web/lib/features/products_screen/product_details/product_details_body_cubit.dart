import 'package:azblob/azblob.dart';
import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

part 'product_details_body_cubit.freezed.dart';

class ProductDetailsBodyCubit extends Cubit<ProductDetailsBodyState> {
  ProductDetailsBodyCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductDetailsBodyStateReady());

  final CQRS _cqrs;
  final _logger = Logger('ProductDetailsBodyCubit');

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null && result.count == 1) {
      emit(ProductDetailsBodyState.ready(
        currentFile: result.files.first,
      ));
    }
  }

  Future<void> createProduct() async {
    // _cqrs.run(CreateProduct());
  }

  // use in create product function
  // ignore: unused_element
  Future<void> _uploadFile() async {
    final state = this.state;
    if (state is! ProductDetailsBodyStateReady) {
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
      emit(ProductDetailsBodyState.error(error: err.toString()));
    }
  }
}

@freezed
class ProductDetailsBodyState with _$ProductDetailsBodyState {
  const factory ProductDetailsBodyState.ready({
    PlatformFile? currentFile,
  }) = ProductDetailsBodyStateReady;
  const factory ProductDetailsBodyState.error({
    required String error,
  }) = ProductDetailsBodyStateError;
}
