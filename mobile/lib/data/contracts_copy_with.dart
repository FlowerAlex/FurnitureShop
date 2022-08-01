import 'package:furniture_shop/data/contracts.dart';

extension ProductDetailsDTOEx on ProductDetailsDTO {
  ProductDetailsDTO copyWith({
    String? name,
    double? price,
    double? averageRating,
    String? previewPhotoId,
    String? categoryId,
    bool? inFavourites,
    bool? inShoppingCart,
    String? description,
    String? modelId,
    List<String>? photosIds,
    String? id,
  }) =>
      ProductDetailsDTO(
        name: name ?? this.name,
        price: price ?? this.price,
        averageRating: averageRating ?? this.averageRating,
        previewPhotoId: previewPhotoId ?? this.previewPhotoId,
        categoryId: categoryId ?? this.categoryId,
        inFavourites: inFavourites ?? this.inFavourites,
        inShoppingCart: inShoppingCart ?? this.inShoppingCart,
        description: description ?? this.description,
        modelId: modelId ?? this.modelId,
        photosIds: photosIds ?? this.photosIds,
        id: id ?? this.id,
      );
}
