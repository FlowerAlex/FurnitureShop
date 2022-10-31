import 'package:azblob/azblob.dart';
import 'package:cqrs/cqrs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

part 'product_form_body_cubit.freezed.dart';

class ProductFormBodyCubit extends Cubit<ProductFormBodyState> {
  ProductFormBodyCubit({
    required CQRS cqrs,
    required AzureStorage azureStorage,
  })  : _cqrs = cqrs,
        _azureStorage = azureStorage,
        super(const ProductFormBodyStateReady());

  final CQRS _cqrs;
  final AzureStorage _azureStorage;
  final _logger = Logger('ProductFormBodyCubit');

  Future<void> init({
    required ProductDetailsDTO? editingProduct,
  }) async {
    final categories = await _cqrs.get(AllCategories());

    emit(
      ProductFormBodyState.ready(
        categories: categories,
        description: editingProduct?.description,
        name: editingProduct?.name,
        price: editingProduct?.price.toString(),
        selectedCategoryId: editingProduct?.categoryId,
        editingProduct: editingProduct,
      ),
    );
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
        selectedCategoryId: selectedCategoryId ?? state.selectedCategoryId,
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
      allowedExtensions: blobType.allowedExtensions,
    );

    if (result != null && result.count == 1) {
      final file = result.files.first;

      switch (blobType) {
        case AppBlobType.image:
          emit(
            state.copyWith(
              currentImage: file,
            ),
          );
          break;
        case AppBlobType.model:
          emit(
            state.copyWith(
              currentModel: file,
            ),
          );
          break;
      }
    }
  }

  Future<void> createProduct() async {
    final state = this.state;
    if (state is! ProductFormBodyStateReady) {
      return;
    }

    final name = state.name;
    final currentImage = state.currentImage;
    final currentModel = state.currentModel;
    final description = state.description;
    final price = state.price;
    final selectedCategoryId = state.selectedCategoryId;

    if (name != null &&
        currentImage != null &&
        currentModel != null &&
        description != null &&
        price != null &&
        selectedCategoryId != null) {
      try {
        final currentImage = state.currentImage;
        final currentModel = state.currentModel;

        String? blobImageId;
        if (currentImage != null) {
          blobImageId = await _cqrs.get(PhotoUploadId());

          final contentType =
              p.extension(currentImage.name).replaceAll('.', '');

          await _azureStorage.putBlob(
            '/images/$blobImageId',
            bodyBytes: currentImage.bytes,
            contentType: contentType,
          );
        }

        String? blobModelId;
        if (currentModel != null) {
          blobModelId = await _cqrs.get(ModelUploadId());

          final contentType =
              p.extension(currentModel.name).replaceAll('.', '');

          await _azureStorage.putBlob(
            '/models/$blobModelId',
            bodyBytes: currentModel.bytes,
            contentType: contentType,
          );
        }

        await _cqrs.run(
          CreateProduct(
            newProduct: CreateProdcutDTO(
              name: name,
              description: description,
              price: double.parse(price),
              categoryId: selectedCategoryId,
              modelId: blobModelId,
              previewPhotoId: blobImageId,
              photoIds: [], // TODO: Add photos when creating product
            ),
          ),
        );

        emit(const ProductFormBodyState.finished());
      } catch (err, st) {
        _logger.severe(err, st);
        emit(ProductFormBodyState.error(error: err.toString()));
      }
    }
  }

  Future<void> editProduct() async {
    final state = this.state;
    if (state is! ProductFormBodyStateReady) {
      return;
    }

    final editingProduct = state.editingProduct;
    if (editingProduct == null) {
      return;
    }

    final name = state.name;
    final description = state.description;
    final price = state.price;
    final selectedCategoryId = state.selectedCategoryId;

    if (name != null &&
        description != null &&
        price != null &&
        selectedCategoryId != null) {
      try {
        final currentImage = state.currentImage;
        final currentModel = state.currentModel;

        var blobImageId = editingProduct.previewPhotoId;
        if (currentImage != null) {
          blobImageId = blobImageId ?? await _cqrs.get(PhotoUploadId());
          final contentType =
              p.extension(currentImage.name).replaceAll('.', '');

          await _azureStorage.putBlob(
            '/images/$blobImageId',
            bodyBytes: currentImage.bytes,
            contentType: contentType,
          );
        }

        var blobModelId = editingProduct.modelId;
        if (currentModel != null) {
          blobModelId = blobModelId ?? await _cqrs.get(ModelUploadId());

          final contentType =
              p.extension(currentModel.name).replaceAll('.', '');

          await _azureStorage.putBlob(
            '/models/$blobModelId',
            bodyBytes: currentModel.bytes,
            contentType: contentType,
          );
        }

        await _cqrs.run(
          UpdateProduct(
            updatedProduct: UpdateProductDTO(
              id: editingProduct.id,
              name: name,
              previewPhotoId: blobImageId,
              modelId: blobModelId,
              description: description,
              price: double.parse(price),
              categoryId: selectedCategoryId,
              photosIds: editingProduct.photosIds,
            ),
          ),
        );

        emit(const ProductFormBodyState.finished());
      } catch (err, st) {
        _logger.severe(err, st);
        emit(ProductFormBodyState.error(error: err.toString()));
      }
    }
  }
}

@freezed
class ProductFormBodyState with _$ProductFormBodyState {
  const factory ProductFormBodyState.ready({
    ProductDetailsDTO? editingProduct,
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    String? name,
    String? price,
    String? description,
    String? selectedCategoryId,
    PlatformFile? currentImage,
    PlatformFile? currentModel,
  }) = ProductFormBodyStateReady;
  const factory ProductFormBodyState.finished() = ProductFormBodyStateFinished;
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
