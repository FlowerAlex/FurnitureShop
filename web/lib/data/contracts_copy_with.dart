import 'package:furniture_shop/data/contracts.dart';

extension UserInfoDTOEx on UserInfoDTO {
  UserInfoDTO copyWith({
    String? id,
    String? firstname,
    String? surname,
    String? username,
    String? emailAddress,
    String? address,
    int? funds,
    bool? isBanned,
  }) =>
      UserInfoDTO(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        surname: surname ?? this.surname,
        username: username ?? this.username,
        emailAddress: emailAddress ?? this.emailAddress,
        address: address ?? this.address,
        funds: funds ?? this.funds,
        isBanned: isBanned ?? this.isBanned,
      );
}

extension ProductDetailsDTOEx on ProductDetailsDTO {
  ProductDetailsDTO copyWith({
    String? name,
    double? price,
    String? description,
    double? averageRating,
    String? previewPhotoId,
    String? categoryId,
    String? id,
    String? modelId,
    List<String>? photosIds,
  }) =>
      ProductDetailsDTO(
        name: name ?? this.name,
        price: price ?? this.price,
        description: description ?? this.description,
        averageRating: averageRating ?? this.averageRating,
        previewPhotoId: previewPhotoId ?? this.previewPhotoId,
        categoryId: categoryId ?? this.categoryId,
        id: id ?? this.id,
        modelId: modelId ?? this.modelId,
        photosIds: photosIds ?? this.photosIds,
      );
}

extension OrderDTOEx on OrderDTO {
  OrderDTO copyWith({
    String? userId,
    double? price,
    String? adress,
    WebOrdersOrderStateDTO? orderState,
    DateTime? orderedDate,
    DateTime? deliveredDate,
    List<ProductInOrderDTO>? products,
    String? id,
    ComplaintDTO? complaint,
  }) =>
      OrderDTO(
        userId: userId ?? this.userId,
        price: price ?? this.price,
        adress: adress ?? this.adress,
        orderState: orderState ?? this.orderState,
        orderedDate: orderedDate ?? this.orderedDate,
        deliveredDate: deliveredDate ?? this.deliveredDate,
        products: products ?? this.products,
        id: id ?? this.id,
        complaint: complaint ?? this.complaint,
      );
}

extension ComplaintEx on ComplaintDTO {
  ComplaintDTO copyWith({
    String? userId,
    String? orderId,
    String? text,
    String? response,
    DateTime? createdDate,
    bool? resolved,
    String? id,
  }) =>
      ComplaintDTO(
        userId: userId ?? this.userId,
        orderId: orderId ?? this.orderId,
        text: text ?? this.text,
        response: response ?? this.response,
        createdDate: createdDate ?? this.createdDate,
        resolved: resolved ?? this.resolved,
        id: id ?? this.id,
      );
}
