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
    List<String>? photoIds,
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
        photoIds: photoIds ?? this.photoIds,
        id: id ?? this.id,
      );
}

extension ShoppingCartDTOEx on ShoppingCartDTO {
  ShoppingCartDTO copyWith({
    double? price,
    List<ShoppingCartProductDTO>? shoppingCartProducts,
  }) =>
      ShoppingCartDTO(
        price: price ?? this.price,
        shoppingCartProducts: shoppingCartProducts ?? this.shoppingCartProducts,
      );
}

extension ProductDTOEx on ProductDTO {
  ProductDTO copyWith({
    String? name,
    double? price,
    String? description,
    double? averageRating,
    String? previewPhotoId,
    String? categoryId,
    bool? inFavourites,
    bool? inShoppingCart,
    String? id,
  }) =>
      ProductDTO(
        name: name ?? this.name,
        price: price ?? this.price,
        description: description ?? this.description,
        averageRating: averageRating ?? this.averageRating,
        previewPhotoId: previewPhotoId ?? this.previewPhotoId,
        categoryId: categoryId ?? this.categoryId,
        inFavourites: inFavourites ?? this.inFavourites,
        inShoppingCart: inShoppingCart ?? this.inShoppingCart,
        id: id ?? this.id,
      );
}

extension ShoppingCartProductDTOEx on ShoppingCartProductDTO {
  ShoppingCartProductDTO copyWith({
    int? amount,
    ProductDTO? product,
  }) =>
      ShoppingCartProductDTO(
        amount: amount ?? this.amount,
        product: product ?? this.product,
      );
}

extension ReviewDataDTOEx on ReviewDataDTO {
  ReviewDataDTO copyWith({
    DateTime? createdDate,
    String? productId,
    double? rating,
    String? text,
  }) =>
      ReviewDataDTO(
        createdDate: createdDate ?? this.createdDate,
        productId: productId ?? this.productId,
        rating: rating ?? this.rating,
        text: text ?? this.text,
      );
}

extension OrderDTOEx on OrderDTO {
  OrderDTO copyWith({
    String? id,
    List<ProductInOrderDTO>? products,
    String? userId,
    double? price,
    String? address,
    ComplaintDTO? complaint,
    OrderStateDTO? orderState,
    DateTime? orderedDate,
    DateTime? deliveredDate,
  }) =>
      OrderDTO(
        id: id ?? this.id,
        products: products ?? this.products,
        userId: userId ?? this.userId,
        price: price ?? this.price,
        address: address ?? this.address,
        complaint: complaint ?? this.complaint,
        orderState: orderState ?? this.orderState,
        orderedDate: orderedDate ?? this.orderedDate,
        deliveredDate: deliveredDate ?? this.deliveredDate,
      );
}
