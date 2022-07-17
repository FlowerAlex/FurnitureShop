import 'package:azblob/azblob.dart';
import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

part 'product_form_body_cubit.freezed.dart';

class ProductFormBodyCubit extends Cubit<ProductFormBodyState> {
  ProductFormBodyCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductFormBodyStateReady());

  final CQRS _cqrs;
  final _logger = Logger('ProductFormBodyCubit');

  Future<void> init() async {
    final categories = await _cqrs.get(GetAllCategories());

    emit(ProductFormBodyState.ready(
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
    if (state is! ProductFormBodyStateReady) {
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
    if (state is! ProductFormBodyStateReady) {
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
    //     ProductForm: ProductFormDTO(),
    //   ),
    // );
  }

  // use in create product function
  // ignore: unused_element
  Future<void> _uploadFiles() async {
    final state = this.state;
    if (state is! ProductFormBodyStateReady) {
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
      emit(ProductFormBodyState.error(error: err.toString()));
    }
  }
}

@freezed
class ProductFormBodyState with _$ProductFormBodyState {
  const factory ProductFormBodyState.ready({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    String? name,
    String? price,
    String? description,
    String? selectedCategoryId,
    PlatformFile? currentImage,
    PlatformFile? currentModel,
  }) = ProductFormBodyStateReady;
  const factory ProductFormBodyState.error({
    required String error,
  }) = ProductFormBodyStateError;
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
