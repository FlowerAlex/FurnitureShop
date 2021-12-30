import 'package:cqrs/contracts.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'contracts.g.dart';

final _ = EquatableConfig.stringify = true;

/// [TimeOfDay] but with seconds precision
class Time with EquatableMixin {
  const Time(this.hour, this.minute, this.second)
      : assert(hour >= 0 && hour <= 23),
        assert(minute >= 0 && minute <= 59),
        assert(second >= 0 && second <= 59);

  factory Time.fromJson(String json) {
    final chunks = json.split(':');
    return Time(
      int.parse(chunks[0]),
      int.parse(chunks[1]),
      int.parse(chunks[2]),
    );
  }

  final int hour;

  final int minute;

  final int second;

  get props => [hour, minute, second];

  String toJson() => '$hour:$minute:$second';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class CategoryById with EquatableMixin implements IRemoteQuery<CategoryDTO> {
  CategoryById({
    required this.id,
  });

  factory CategoryById.fromJson(Map<String, dynamic> json) =>
      _$CategoryByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$CategoryByIdToJson(this);
  CategoryDTO resultFactory(dynamic decodedJson) =>
      _$CategoryDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Categories.CategoryById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class CategoryDTO with EquatableMixin {
  CategoryDTO({
    required this.id,
    required this.name,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  final String id;

  final String name;

  get props => [id, name];

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateCategory with EquatableMixin implements IRemoteCommand {
  CreateCategory({
    required this.categoryName,
  });

  factory CreateCategory.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryFromJson(json);

  final String categoryName;

  get props => [categoryName];

  Map<String, dynamic> toJson() => _$CreateCategoryToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Categories.CreateCategory';
}

class CreateCategoryErrorCodes {
  static const emptyArgs = 1;
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class DeleteCategory with EquatableMixin implements IRemoteCommand {
  DeleteCategory({
    required this.id,
  });

  factory DeleteCategory.fromJson(Map<String, dynamic> json) =>
      _$DeleteCategoryFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$DeleteCategoryToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Categories.DeleteCategory';
}

class DeleteCategoryErrorCodes {
  static const emptyArgs = 1;
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllCategories
    with EquatableMixin
    implements IRemoteQuery<List<CategoryDTO>> {
  GetAllCategories();

  factory GetAllCategories.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$GetAllCategoriesToJson(this);
  List<CategoryDTO> resultFactory(dynamic decodedJson) =>
      (decodedJson as Iterable<dynamic>)
          .map((dynamic e) => _$CategoryDTOFromJson(e as Map<String, dynamic>))
          .toList();
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Categories.GetAllCategories';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateCategory with EquatableMixin implements IRemoteCommand {
  UpdateCategory({
    required this.id,
    required this.newName,
  });

  factory UpdateCategory.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryFromJson(json);

  final String id;

  final String newName;

  get props => [id, newName];

  Map<String, dynamic> toJson() => _$UpdateCategoryToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Categories.UpdateCategory';
}

class UpdateCategoryErrorCodes {
  static const emptyArgs = 1;
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintById with EquatableMixin implements IRemoteQuery<ComplaintDTO> {
  ComplaintById({
    required this.id,
  });

  factory ComplaintById.fromJson(Map<String, dynamic> json) =>
      _$ComplaintByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ComplaintByIdToJson(this);
  ComplaintDTO resultFactory(dynamic decodedJson) =>
      _$ComplaintDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.ComplaintById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintDTO with EquatableMixin {
  ComplaintDTO({
    required this.id,
    required this.complaintInfo,
  });

  factory ComplaintDTO.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDTOFromJson(json);

  final String id;

  final ComplaintInfoDTO complaintInfo;

  get props => [id, complaintInfo];

  Map<String, dynamic> toJson() => _$ComplaintDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintInfoDTO with EquatableMixin {
  ComplaintInfoDTO({
    this.userId,
    this.orderId,
    required this.text,
    this.response,
    required this.createdDate,
    required this.resolved,
  });

  factory ComplaintInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$ComplaintInfoDTOFromJson(json);

  final String? userId;

  final String? orderId;

  final String text;

  final String? response;

  final DateTime createdDate;

  final bool resolved;

  get props => [userId, orderId, text, response, createdDate, resolved];

  Map<String, dynamic> toJson() => _$ComplaintInfoDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateComplaint with EquatableMixin implements IRemoteCommand {
  CreateComplaint({
    required this.complaintInfo,
  });

  factory CreateComplaint.fromJson(Map<String, dynamic> json) =>
      _$CreateComplaintFromJson(json);

  final ComplaintInfoDTO complaintInfo;

  get props => [complaintInfo];

  Map<String, dynamic> toJson() => _$CreateComplaintToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.CreateComplaint';
}

class CreateComplaintErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class DeleteComplaint with EquatableMixin implements IRemoteCommand {
  DeleteComplaint({
    required this.id,
  });

  factory DeleteComplaint.fromJson(Map<String, dynamic> json) =>
      _$DeleteComplaintFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$DeleteComplaintToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.DeleteComplaint';
}

class DeleteComplaintErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateComplaint with EquatableMixin implements IRemoteCommand {
  UpdateComplaint({
    required this.id,
    required this.complaintInfo,
  });

  factory UpdateComplaint.fromJson(Map<String, dynamic> json) =>
      _$UpdateComplaintFromJson(json);

  final String id;

  final ComplaintInfoDTO complaintInfo;

  get props => [id, complaintInfo];

  Map<String, dynamic> toJson() => _$UpdateComplaintToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.UpdateComplaint';
}

class UpdateComplaintErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateOrder with EquatableMixin implements IRemoteCommand {
  CreateOrder({
    required this.orderInfo,
  });

  factory CreateOrder.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderFromJson(json);

  final OrderInfoDTO orderInfo;

  get props => [orderInfo];

  Map<String, dynamic> toJson() => _$CreateOrderToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Orders.CreateOrder';
}

class CreateOrderErrorCodes {
  static const incorrectAddress = 1;

  static const noProducts = 2;
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderById with EquatableMixin implements IRemoteQuery<OrderDTO> {
  OrderById({
    required this.id,
  });

  factory OrderById.fromJson(Map<String, dynamic> json) =>
      _$OrderByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$OrderByIdToJson(this);
  OrderDTO resultFactory(dynamic decodedJson) =>
      _$OrderDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Orders.OrderById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderDTO with EquatableMixin {
  OrderDTO({
    required this.id,
    required this.orderInfo,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);

  final String id;

  final OrderInfoDTO orderInfo;

  get props => [id, orderInfo];

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderInfoDTO with EquatableMixin {
  OrderInfoDTO({
    this.userId,
    required this.price,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.orderState,
    required this.orderedDate,
    this.deliveredDate,
    required this.orderProducts,
  });

  factory OrderInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoDTOFromJson(json);

  final String? userId;

  final double price;

  final String street;

  final String city;

  final String state;

  final String postalCode;

  final String country;

  final String orderState;

  final DateTime orderedDate;

  final DateTime? deliveredDate;

  final List<OrderProductDTO> orderProducts;

  get props => [
        userId,
        price,
        street,
        city,
        state,
        postalCode,
        country,
        orderState,
        orderedDate,
        deliveredDate,
        orderProducts
      ];

  Map<String, dynamic> toJson() => _$OrderInfoDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderProductDTO with EquatableMixin {
  OrderProductDTO({
    this.productId,
    required this.amount,
  });

  factory OrderProductDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderProductDTOFromJson(json);

  final String? productId;

  final int amount;

  get props => [productId, amount];

  Map<String, dynamic> toJson() => _$OrderProductDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateProduct with EquatableMixin implements IRemoteCommand {
  CreateProduct({
    required this.productInfo,
  });

  factory CreateProduct.fromJson(Map<String, dynamic> json) =>
      _$CreateProductFromJson(json);

  final ProductInfoDTO productInfo;

  get props => [productInfo];

  Map<String, dynamic> toJson() => _$CreateProductToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.CreateProduct';
}

class CreateProductErrorCodes {
  static const incorrectName = 1;

  static const incorrectDescription = 2;

  static const incorrectPrice = 3;
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class DeleteProduct with EquatableMixin implements IRemoteCommand {
  DeleteProduct({
    required this.id,
  });

  factory DeleteProduct.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$DeleteProductToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.DeleteProduct';
}

class DeleteProductErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllProducts
    with EquatableMixin
    implements IRemoteQuery<List<ProductDTO>> {
  GetAllProducts({
    this.categoryId,
  });

  factory GetAllProducts.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsFromJson(json);

  final String? categoryId;

  get props => [categoryId];

  Map<String, dynamic> toJson() => _$GetAllProductsToJson(this);
  List<ProductDTO> resultFactory(dynamic decodedJson) =>
      (decodedJson as Iterable<dynamic>)
          .map((dynamic e) => _$ProductDTOFromJson(e as Map<String, dynamic>))
          .toList();
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.GetAllProducts';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductById with EquatableMixin implements IRemoteQuery<ProductDTO> {
  ProductById({
    required this.id,
  });

  factory ProductById.fromJson(Map<String, dynamic> json) =>
      _$ProductByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ProductByIdToJson(this);
  ProductDTO resultFactory(dynamic decodedJson) =>
      _$ProductDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.ProductById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDTO with EquatableMixin {
  ProductDTO({
    required this.id,
    required this.productInfo,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  final String id;

  final ProductInfoDTO productInfo;

  get props => [id, productInfo];

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductInfoDTO with EquatableMixin {
  ProductInfoDTO({
    required this.description,
    required this.price,
    required this.name,
    this.modelUrl,
    this.categoryId,
  });

  factory ProductInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoDTOFromJson(json);

  final String description;

  final double price;

  final String name;

  final String? modelUrl;

  final String? categoryId;

  get props => [description, price, name, modelUrl, categoryId];

  Map<String, dynamic> toJson() => _$ProductInfoDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateProduct with EquatableMixin implements IRemoteCommand {
  UpdateProduct({
    required this.id,
    required this.productInfo,
  });

  factory UpdateProduct.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductFromJson(json);

  final String id;

  final ProductInfoDTO productInfo;

  get props => [id, productInfo];

  Map<String, dynamic> toJson() => _$UpdateProductToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.UpdateProduct';
}

class UpdateProductErrorCodes {
  static const incorrectName = 1;

  static const incorrectDescription = 2;

  static const incorrectPrice = 3;
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateReview with EquatableMixin implements IRemoteCommand {
  CreateReview({
    required this.reviewInfo,
  });

  factory CreateReview.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewFromJson(json);

  final ReviewInfoDTO reviewInfo;

  get props => [reviewInfo];

  Map<String, dynamic> toJson() => _$CreateReviewToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.CreateReview';
}

class CreateReviewErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class DeleteReview with EquatableMixin implements IRemoteCommand {
  DeleteReview({
    required this.id,
  });

  factory DeleteReview.fromJson(Map<String, dynamic> json) =>
      _$DeleteReviewFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$DeleteReviewToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.DeleteReview';
}

class DeleteReviewErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllReviews
    with EquatableMixin
    implements IRemoteQuery<List<ReviewDTO>> {
  GetAllReviews({
    this.productId,
    this.userId,
  });

  factory GetAllReviews.fromJson(Map<String, dynamic> json) =>
      _$GetAllReviewsFromJson(json);

  final String? productId;

  final String? userId;

  get props => [productId, userId];

  Map<String, dynamic> toJson() => _$GetAllReviewsToJson(this);
  List<ReviewDTO> resultFactory(dynamic decodedJson) =>
      (decodedJson as Iterable<dynamic>)
          .map((dynamic e) => _$ReviewDTOFromJson(e as Map<String, dynamic>))
          .toList();
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.GetAllReviews';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewById with EquatableMixin implements IRemoteQuery<ReviewDTO> {
  ReviewById({
    required this.id,
  });

  factory ReviewById.fromJson(Map<String, dynamic> json) =>
      _$ReviewByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ReviewByIdToJson(this);
  ReviewDTO resultFactory(dynamic decodedJson) =>
      _$ReviewDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.ReviewById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewDTO with EquatableMixin {
  ReviewDTO({
    required this.id,
    required this.reviewInfo,
  });

  factory ReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDTOFromJson(json);

  final String id;

  final ReviewInfoDTO reviewInfo;

  get props => [id, reviewInfo];

  Map<String, dynamic> toJson() => _$ReviewDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewInfoDTO with EquatableMixin {
  ReviewInfoDTO({
    this.userId,
    this.productId,
    required this.text,
    required this.rating,
    required this.createdDate,
  });

  factory ReviewInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoDTOFromJson(json);

  final String? userId;

  final String? productId;

  final String text;

  final double rating;

  final DateTime createdDate;

  get props => [userId, productId, text, rating, createdDate];

  Map<String, dynamic> toJson() => _$ReviewInfoDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateReview with EquatableMixin implements IRemoteCommand {
  UpdateReview({
    required this.id,
    required this.reviewInfo,
  });

  factory UpdateReview.fromJson(Map<String, dynamic> json) =>
      _$UpdateReviewFromJson(json);

  final String id;

  final ReviewInfoDTO reviewInfo;

  get props => [id, reviewInfo];

  Map<String, dynamic> toJson() => _$UpdateReviewToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.UpdateReview';
}

class UpdateReviewErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class RegisterUser with EquatableMixin implements IRemoteCommand {
  RegisterUser({
    required this.userInfo,
    required this.password,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);

  final UserInfoDTO userInfo;

  final String password;

  get props => [userInfo, password];

  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Users.RegisterUser';
}

class RegisterUserErrorCodes {
  static const userDTOIsNull = 1;

  static const passwordTooWeak = 2;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserInfoDTO with EquatableMixin {
  UserInfoDTO({
    required this.firstname,
    required this.surname,
    required this.username,
    required this.emailAddress,
  });

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);

  final String firstname;

  final String surname;

  final String username;

  final String emailAddress;

  get props => [firstname, surname, username, emailAddress];

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}
