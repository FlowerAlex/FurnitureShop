// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
part 'contracts.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class Auth with EquatableMixin {
  Auth();

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Clients with EquatableMixin {
  Clients();

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);

  static const String adminApp = 'admin_app';

  static const String clientApp = 'client_app';

  get props => [];

  Map<String, dynamic> toJson() => _$ClientsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class KnownClaims with EquatableMixin {
  KnownClaims();

  factory KnownClaims.fromJson(Map<String, dynamic> json) =>
      _$KnownClaimsFromJson(json);

  static const String userId = 'sub';

  static const String role = 'role';

  get props => [];

  Map<String, dynamic> toJson() => _$KnownClaimsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Roles with EquatableMixin {
  Roles();

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  static const String user = 'user';

  static const String admin = 'admin';

  get props => [];

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Scopes with EquatableMixin {
  Scopes();

  factory Scopes.fromJson(Map<String, dynamic> json) => _$ScopesFromJson(json);

  static const String internalApi = 'internal_api';

  get props => [];

  Map<String, dynamic> toJson() => _$ScopesToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class CategoryById with EquatableMixin implements Query<CategoryDTO> {
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
class CreateCategory with EquatableMixin implements Command {
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
class DeleteCategory with EquatableMixin implements Command {
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
class GetAllCategories with EquatableMixin implements Query<List<CategoryDTO>> {
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
class UpdateCategory with EquatableMixin implements Command {
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
class ComplaintById with EquatableMixin implements Query<ComplaintDTO> {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateComplaint with EquatableMixin implements Command {
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
class DeleteComplaint with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllComplaints
    with EquatableMixin
    implements PaginatedQuery<ComplaintDTO> {
  GetAllComplaints({
    required this.pageNumber,
    required this.pageSize,
  });

  factory GetAllComplaints.fromJson(Map<String, dynamic> json) =>
      _$GetAllComplaintsFromJson(json);

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$GetAllComplaintsToJson(this);
  PaginatedResult<ComplaintDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ComplaintDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.GetAllComplaints';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateComplaint with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateOrder with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllOrders
    with
        EquatableMixin
    implements
        SortableMulitiFilterPaginatedQuery<OrderDTO, OrdersSortFieldDTO?,
            OrdersFilterFieldDTO> {
  GetAllOrders({
    required this.pageNumber,
    required this.pageSize,
    required this.filterBy,
    this.sortBy,
    required this.sortByDescending,
  });

  factory GetAllOrders.fromJson(Map<String, dynamic> json) =>
      _$GetAllOrdersFromJson(json);

  final int pageNumber;

  final int pageSize;

  final Map<OrdersFilterFieldDTO, String> filterBy;

  final OrdersSortFieldDTO? sortBy;

  final bool sortByDescending;

  get props => [pageNumber, pageSize, filterBy, sortBy, sortByDescending];

  Map<String, dynamic> toJson() => _$GetAllOrdersToJson(this);
  PaginatedResult<OrderDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$OrderDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Orders.GetAllOrders';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderById with EquatableMixin implements Query<OrderDTO> {
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
    required this.orderId,
    required this.product,
    required this.amount,
  });

  factory OrderProductDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderProductDTOFromJson(json);

  final String orderId;

  final ProductDTO product;

  final int amount;

  get props => [orderId, product, amount];

  Map<String, dynamic> toJson() => _$OrderProductDTOToJson(this);
}

enum OrdersFilterFieldDTO {
  @JsonValue(0)
  orderState,
  @JsonValue(1)
  country,
  @JsonValue(2)
  state,
  @JsonValue(3)
  city,
  @JsonValue(4)
  street,
  @JsonValue(5)
  postalCode,
  @JsonValue(6)
  userId
}
enum OrdersSortFieldDTO {
  @JsonValue(0)
  orderedDate,
  @JsonValue(1)
  deliveredDate
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class SetOrderState with EquatableMixin implements Command {
  SetOrderState({
    required this.id,
    required this.orderState,
  });

  factory SetOrderState.fromJson(Map<String, dynamic> json) =>
      _$SetOrderStateFromJson(json);

  final String id;

  final String orderState;

  get props => [id, orderState];

  Map<String, dynamic> toJson() => _$SetOrderStateToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Orders.SetOrderState';
}

class SetOrderStateErrorCodes {
  static const incorrectState = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateProduct with EquatableMixin implements Command {
  CreateProduct({
    required this.productDetails,
  });

  factory CreateProduct.fromJson(Map<String, dynamic> json) =>
      _$CreateProductFromJson(json);

  final ProductDetailsDTO productDetails;

  get props => [productDetails];

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
class DeleteProduct with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllProducts
    with EquatableMixin
    implements SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?> {
  GetAllProducts({
    required this.pageNumber,
    required this.pageSize,
    this.filterBy,
    this.sortBy,
    required this.sortByDescending,
    this.categoryId,
  });

  factory GetAllProducts.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsFromJson(json);

  final int pageNumber;

  final int pageSize;

  final String? filterBy;

  final ProductsSortFieldDTO? sortBy;

  final bool sortByDescending;

  final String? categoryId;

  get props =>
      [pageNumber, pageSize, filterBy, sortBy, sortByDescending, categoryId];

  Map<String, dynamic> toJson() => _$GetAllProductsToJson(this);
  PaginatedResult<ProductDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ProductDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.GetAllProducts';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductById with EquatableMixin implements Query<ProductWithDetailsDTO> {
  ProductById({
    required this.id,
  });

  factory ProductById.fromJson(Map<String, dynamic> json) =>
      _$ProductByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ProductByIdToJson(this);
  ProductWithDetailsDTO resultFactory(dynamic decodedJson) =>
      _$ProductWithDetailsDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.ProductById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDetailsDTO with EquatableMixin implements ProductInfoDTO {
  ProductDetailsDTO({
    required this.name,
    required this.price,
    this.averageRating,
    this.previewPhotoURL,
    this.categoryId,
    required this.description,
    this.modelUrl,
  });

  factory ProductDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDTOFromJson(json);

  final String name;

  final double price;

  final double? averageRating;

  final String? previewPhotoURL;

  final String? categoryId;

  final String description;

  final String? modelUrl;

  get props => [
        name,
        price,
        averageRating,
        previewPhotoURL,
        categoryId,
        description,
        modelUrl
      ];

  Map<String, dynamic> toJson() => _$ProductDetailsDTOToJson(this);
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
    required this.name,
    required this.price,
    this.averageRating,
    this.previewPhotoURL,
    this.categoryId,
  });

  factory ProductInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoDTOFromJson(json);

  final String name;

  final double price;

  final double? averageRating;

  final String? previewPhotoURL;

  final String? categoryId;

  get props => [name, price, averageRating, previewPhotoURL, categoryId];

  Map<String, dynamic> toJson() => _$ProductInfoDTOToJson(this);
}

enum ProductsSortFieldDTO {
  @JsonValue(0)
  name,
  @JsonValue(1)
  rating
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductWithDetailsDTO with EquatableMixin {
  ProductWithDetailsDTO({
    required this.id,
    required this.productDetails,
  });

  factory ProductWithDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductWithDetailsDTOFromJson(json);

  final String id;

  final ProductDetailsDTO productDetails;

  get props => [id, productDetails];

  Map<String, dynamic> toJson() => _$ProductWithDetailsDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateProduct with EquatableMixin implements Command {
  UpdateProduct({
    required this.id,
    required this.productDetails,
  });

  factory UpdateProduct.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductFromJson(json);

  final String id;

  final ProductDetailsDTO productDetails;

  get props => [id, productDetails];

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
class CreateReview with EquatableMixin implements Command {
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
class DeleteReview with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetAllReviews with EquatableMixin implements PaginatedQuery<ReviewDTO> {
  GetAllReviews({
    required this.pageNumber,
    required this.pageSize,
    required this.productId,
  });

  factory GetAllReviews.fromJson(Map<String, dynamic> json) =>
      _$GetAllReviewsFromJson(json);

  final int pageNumber;

  final int pageSize;

  final String productId;

  get props => [pageNumber, pageSize, productId];

  Map<String, dynamic> toJson() => _$GetAllReviewsToJson(this);
  PaginatedResult<ReviewDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ReviewDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.GetAllReviews';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewById with EquatableMixin implements Query<ReviewDTO> {
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
class UpdateReview with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AddProductsToShoppingCart with EquatableMixin implements Command {
  AddProductsToShoppingCart({
    required this.productId,
    required this.amount,
  });

  factory AddProductsToShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$AddProductsToShoppingCartFromJson(json);

  final String productId;

  final int amount;

  get props => [productId, amount];

  Map<String, dynamic> toJson() => _$AddProductsToShoppingCartToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.ShoppingCart.AddProductsToShoppingCart';
}

class AddProductsToShoppingCartErrorCodes {
  static const incorrectAmount = 1;

  static const productNotFound = 2;

  static const shoppingCartNotFound = 3;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class RemoveProductFromShoppingCart with EquatableMixin implements Command {
  RemoveProductFromShoppingCart({
    required this.productId,
  });

  factory RemoveProductFromShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$RemoveProductFromShoppingCartFromJson(json);

  final String productId;

  get props => [productId];

  Map<String, dynamic> toJson() => _$RemoveProductFromShoppingCartToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.ShoppingCart.RemoveProductFromShoppingCart';
}

class RemoveProductFromShoppingCartErrorCodes {
  static const shoppingCartNotFound = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCart with EquatableMixin implements Query<ShoppingCartDTO> {
  ShoppingCart();

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);
  ShoppingCartDTO resultFactory(dynamic decodedJson) =>
      _$ShoppingCartDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.ShoppingCart.ShoppingCart';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCartDTO with EquatableMixin {
  ShoppingCartDTO({
    required this.id,
    required this.shoppingCartInfo,
  });

  factory ShoppingCartDTO.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartDTOFromJson(json);

  final String id;

  final ShoppingCartInfoDTO shoppingCartInfo;

  get props => [id, shoppingCartInfo];

  Map<String, dynamic> toJson() => _$ShoppingCartDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCartInfoDTO with EquatableMixin {
  ShoppingCartInfoDTO({
    this.userId,
    required this.price,
    required this.shoppingCartProducts,
  });

  factory ShoppingCartInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartInfoDTOFromJson(json);

  final String? userId;

  final double price;

  final List<ShoppingCartProductDTO> shoppingCartProducts;

  get props => [userId, price, shoppingCartProducts];

  Map<String, dynamic> toJson() => _$ShoppingCartInfoDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCartProductDTO with EquatableMixin {
  ShoppingCartProductDTO({
    required this.amount,
    required this.product,
    required this.shoppingCartId,
  });

  factory ShoppingCartProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartProductDTOFromJson(json);

  final int amount;

  final ProductDTO product;

  final String shoppingCartId;

  get props => [amount, product, shoppingCartId];

  Map<String, dynamic> toJson() => _$ShoppingCartProductDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class RegisterUser with EquatableMixin implements Command {
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateProfile with EquatableMixin implements Command {
  UpdateProfile({
    this.firstname,
    this.surname,
    this.username,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileFromJson(json);

  final String? firstname;

  final String? surname;

  final String? username;

  get props => [firstname, surname, username];

  Map<String, dynamic> toJson() => _$UpdateProfileToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Users.UpdateProfile';
}

class UpdateProfileErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class UserInfo with EquatableMixin implements Query<UserInfoDTO> {
  UserInfo();

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  UserInfoDTO resultFactory(dynamic decodedJson) =>
      _$UserInfoDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() => 'FurnitureShop.Core.Contracts.Mobile.Users.UserInfo';
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

abstract class PaginatedQuery<TResult>
    with EquatableMixin
    implements Query<PaginatedResult<TResult>> {
  PaginatedQuery({
    required this.pageNumber,
    required this.pageSize,
  });

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];
}

@JsonSerializable(
    fieldRename: FieldRename.pascal, genericArgumentFactories: true)
class PaginatedResult<TResult> with EquatableMixin {
  PaginatedResult({
    required this.items,
    required this.totalCount,
  });

  factory PaginatedResult.fromJson(Map<String, dynamic> json,
          TResult Function(Object?) fromJsonTResult) =>
      _$PaginatedResultFromJson(json, fromJsonTResult);

  final List<TResult> items;

  final int totalCount;

  get props => [items, totalCount];
}

abstract class SortableMulitiFilterPaginatedQuery<TResult, TBy, TFBy>
    with EquatableMixin
    implements PaginatedQuery<TResult> {
  SortableMulitiFilterPaginatedQuery({
    required this.pageNumber,
    required this.pageSize,
    required this.filterBy,
    required this.sortBy,
    required this.sortByDescending,
  });

  final int pageNumber;

  final int pageSize;

  final Map<TFBy, String> filterBy;

  final TBy sortBy;

  final bool sortByDescending;

  get props => [pageNumber, pageSize, filterBy, sortBy, sortByDescending];
}

abstract class SortablePaginatedQuery<TResult, TBy>
    with EquatableMixin
    implements PaginatedQuery<TResult> {
  SortablePaginatedQuery({
    required this.pageNumber,
    required this.pageSize,
    this.filterBy,
    required this.sortBy,
    required this.sortByDescending,
  });

  final int pageNumber;

  final int pageSize;

  final String? filterBy;

  final TBy sortBy;

  final bool sortByDescending;

  get props => [pageNumber, pageSize, filterBy, sortBy, sortByDescending];
}
