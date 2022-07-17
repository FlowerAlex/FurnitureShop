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

  Future<void> init() async {
    final categories = await _cqrs.get(GetAllCategories());

    emit(ProductDetailsBodyState.ready(
      categories: categories,
    ));
  }

  void updateProduct({
    String? name,
    String? price,
    String? description,
    String? selectedCategoryId,
  }) {
    final state = this.state;
    if (state is! ProductDetailsBodyStateReady) {
      return;
    }

    emit(
      state.copyWith(
        name: name ?? state.name,
        price: price ?? state.price,
        description: description ?? state.description,
        selectedCategoryId: selectedCategoryId ?? selectedCategoryId,
      ),
    );
  }

  Future<void> pickFile(AppBlobType blobType) async {
    final state = this.state;
    if (state is! ProductDetailsBodyStateReady) {
      return;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: blobType.allowedExtensions,
    );

    if (result != null && result.count == 1) {
      final file = result.files.first;

      switch (blobType) {
        case AppBlobType.image:
          emit(state.copyWith(
            currentImage: file,
          ));
          break;
        case AppBlobType.model:
          emit(state.copyWith(
            currentModel: file,
          ));
          break;
      }
    }
  }

  Future<void> createProduct() async {
    // _cqrs.run(
    //   CreateProduct(
    //     productDetails: ProductDetailsDTO(),
    //   ),
    // );
  }

  // use in create product function
  // ignore: unused_element
  Future<void> _uploadFiles() async {
    final state = this.state;
    if (state is! ProductDetailsBodyStateReady) {
      return;
    }

    try {
      final currentImage = state.currentImage;

      var storage = AzureStorage.parse(
          'DefaultEndpointsProtocol=https;AccountName=furnitureshopstorage;AccountKey=6SRIXCdjvPICeOpofs4bKBTpEz+Wkgxkrp2Hv4wob/t+gLu+3qll4IYB/emr6AyiqfYK3KCqmYqM+AStRi2ouw==;EndpointSuffix=core.windows.net');

      if (currentImage != null) {
        final result = await _cqrs.get(GetPhotoUploadLink(
          blobName: currentImage.name,
        ));

        final contentType = p.extension(currentImage.name).replaceAll('.', '');

        await storage.putBlob(
          '/images/$result',
          bodyBytes: currentImage.bytes,
          contentType: contentType,
          type: BlobType.BlockBlob,
        );
      }
      final currentModel = state.currentModel;

      if (currentModel != null) {
        final result = await _cqrs.get(GetPhotoUploadLink(
          blobName: currentModel.name,
        ));

        final contentType = p.extension(currentModel.name).replaceAll('.', '');

        await storage.putBlob(
          '/models/$result',
          bodyBytes: currentModel.bytes,
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
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    String? name,
    String? price,
    String? description,
    String? selectedCategoryId,
    PlatformFile? currentImage,
    PlatformFile? currentModel,
  }) = ProductDetailsBodyStateReady;
  const factory ProductDetailsBodyState.error({
    required String error,
  }) = ProductDetailsBodyStateError;
}

enum AppBlobType {
  image,
  model,
}
AppBlobType? appBlobTypeFromExtension(String? extension) {
  if (extension == null) {
    return null;
  }

  final ext = extension.replaceAll('.', '');

  if (AppBlobType.image.allowedExtensions.contains(ext)) {
    return AppBlobType.image;
  }
  if (AppBlobType.model.allowedExtensions.contains(ext)) {
    return AppBlobType.model;
  }

  return null;
}

extension on AppBlobType {
  List<String> get allowedExtensions {
    switch (this) {
      case AppBlobType.image:
        return ['png', 'jpg'];
      case AppBlobType.model:
        return ['glTF', 'GLB'];
    }
  }
}
