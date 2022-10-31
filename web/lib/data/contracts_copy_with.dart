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
