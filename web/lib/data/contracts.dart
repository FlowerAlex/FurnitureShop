// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
part 'contracts.g.dart';

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllCategories with EquatableMixin implements Query<List<CategoryDTO>> {
  AllCategories();

  factory AllCategories.fromJson(Map<String, dynamic> json) =>
      _$AllCategoriesFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$AllCategoriesToJson(this);
  List<CategoryDTO> resultFactory(dynamic decodedJson) =>
      (decodedJson as Iterable<dynamic>)
          .map((dynamic e) => _$CategoryDTOFromJson(e as Map<String, dynamic>))
          .toList();
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Shared.Categories.AllCategories';
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

enum SharedOrdersOrderStateDTO {
  @JsonValue(0)
  pending,
  @JsonValue(1)
  cancelled,
  @JsonValue(2)
  inProgress,
  @JsonValue(3)
  finished
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

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDTOBase with EquatableMixin {
  ProductDTOBase({
    required this.name,
    required this.price,
    required this.description,
    this.averageRating,
    this.previewPhotoId,
    this.categoryId,
  });

  factory ProductDTOBase.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOBaseFromJson(json);

  final String name;

  final double price;

  final String description;

  final double? averageRating;

  final String? previewPhotoId;

  final String? categoryId;

  get props =>
      [name, price, description, averageRating, previewPhotoId, categoryId];

  Map<String, dynamic> toJson() => _$ProductDTOBaseToJson(this);
}

enum ProductsSortFieldDTO {
  @JsonValue(0)
  name,
  @JsonValue(1)
  rating,
  @JsonValue(2)
  price
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllModelsUrls with EquatableMixin implements Query<List<String>> {
  AllModelsUrls();

  factory AllModelsUrls.fromJson(Map<String, dynamic> json) =>
      _$AllModelsUrlsFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$AllModelsUrlsToJson(this);
  List<String> resultFactory(dynamic decodedJson) =>
      (decodedJson as Iterable<dynamic>)
          .map((dynamic e) => e as String)
          .toList();
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Blobs.AllModelsUrls';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllPhotosUrls with EquatableMixin implements Query<List<String>> {
  AllPhotosUrls();

  factory AllPhotosUrls.fromJson(Map<String, dynamic> json) =>
      _$AllPhotosUrlsFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$AllPhotosUrlsToJson(this);
  List<String> resultFactory(dynamic decodedJson) =>
      (decodedJson as Iterable<dynamic>)
          .map((dynamic e) => e as String)
          .toList();
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Blobs.AllPhotosUrls';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ModelUploadId with EquatableMixin implements Query<String> {
  ModelUploadId();

  factory ModelUploadId.fromJson(Map<String, dynamic> json) =>
      _$ModelUploadIdFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$ModelUploadIdToJson(this);
  String resultFactory(dynamic decodedJson) => decodedJson as String;
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Blobs.ModelUploadId';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class PhotoUploadId with EquatableMixin implements Query<String> {
  PhotoUploadId();

  factory PhotoUploadId.fromJson(Map<String, dynamic> json) =>
      _$PhotoUploadIdFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$PhotoUploadIdToJson(this);
  String resultFactory(dynamic decodedJson) => decodedJson as String;
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Blobs.PhotoUploadId';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CategoryById with EquatableMixin implements Query<CategoryDTO?> {
  CategoryById({
    required this.id,
  });

  factory CategoryById.fromJson(Map<String, dynamic> json) =>
      _$CategoryByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$CategoryByIdToJson(this);
  CategoryDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$CategoryDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Categories.CategoryById';
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
      'FurnitureShop.Core.Contracts.Web.Categories.CreateCategory';
}

class CreateCategoryErrorCodes {
  static const incorrectName = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
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
      'FurnitureShop.Core.Contracts.Web.Categories.DeleteCategory';
}

class DeleteCategoryErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
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
      'FurnitureShop.Core.Contracts.Web.Categories.UpdateCategory';
}

class UpdateCategoryErrorCodes {
  static const incorrectName = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllComplaints
    with EquatableMixin
    implements PaginatedQuery<ComplaintDTO> {
  AllComplaints({
    required this.pageNumber,
    required this.pageSize,
  });

  factory AllComplaints.fromJson(Map<String, dynamic> json) =>
      _$AllComplaintsFromJson(json);

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$AllComplaintsToJson(this);
  PaginatedResult<ComplaintDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ComplaintDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Complaints.AllComplaints';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintById with EquatableMixin implements Query<ComplaintDTO?> {
  ComplaintById({
    required this.id,
  });

  factory ComplaintById.fromJson(Map<String, dynamic> json) =>
      _$ComplaintByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ComplaintByIdToJson(this);
  ComplaintDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$ComplaintDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Complaints.ComplaintById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintDTO with EquatableMixin implements ComplaintDTOBase {
  ComplaintDTO({
    this.userId,
    this.orderId,
    required this.text,
    this.response,
    required this.createdDate,
    required this.resolved,
    required this.id,
  });

  factory ComplaintDTO.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDTOFromJson(json);

  final String? userId;

  final String? orderId;

  final String text;

  final String? response;

  final DateTime createdDate;

  final bool resolved;

  final String id;

  get props => [userId, orderId, text, response, createdDate, resolved, id];

  Map<String, dynamic> toJson() => _$ComplaintDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintDTOBase with EquatableMixin {
  ComplaintDTOBase({
    this.userId,
    this.orderId,
    required this.text,
    this.response,
    required this.createdDate,
    required this.resolved,
  });

  factory ComplaintDTOBase.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDTOBaseFromJson(json);

  final String? userId;

  final String? orderId;

  final String text;

  final String? response;

  final DateTime createdDate;

  final bool resolved;

  get props => [userId, orderId, text, response, createdDate, resolved];

  Map<String, dynamic> toJson() => _$ComplaintDTOBaseToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllOrders
    with
        EquatableMixin
    implements
        SortableMulitiFilterPaginatedQuery<OrderDTO, OrdersSortFieldDTO?,
            OrdersFilterFieldDTO> {
  AllOrders({
    required this.pageNumber,
    required this.pageSize,
    required this.filterBy,
    this.sortBy,
    required this.sortByDescending,
  });

  factory AllOrders.fromJson(Map<String, dynamic> json) =>
      _$AllOrdersFromJson(json);

  final int pageNumber;

  final int pageSize;

  final Map<OrdersFilterFieldDTO, String> filterBy;

  final OrdersSortFieldDTO? sortBy;

  final bool sortByDescending;

  get props => [pageNumber, pageSize, filterBy, sortBy, sortByDescending];

  Map<String, dynamic> toJson() => _$AllOrdersToJson(this);
  PaginatedResult<OrderDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$OrderDTOFromJson(e as Map<String, dynamic>));
  String getFullName() => 'FurnitureShop.Core.Contracts.Web.Orders.AllOrders';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderById with EquatableMixin implements Query<OrderDTO?> {
  OrderById({
    required this.id,
  });

  factory OrderById.fromJson(Map<String, dynamic> json) =>
      _$OrderByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$OrderByIdToJson(this);
  OrderDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$OrderDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() => 'FurnitureShop.Core.Contracts.Web.Orders.OrderById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderDTO with EquatableMixin implements OrderDTOBase {
  OrderDTO({
    this.userId,
    required this.price,
    required this.adress,
    required this.orderState,
    required this.orderedDate,
    this.deliveredDate,
    required this.products,
    required this.id,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);

  final String? userId;

  final double price;

  final String adress;

  final WebOrdersOrderStateDTO orderState;

  final DateTime orderedDate;

  final DateTime? deliveredDate;

  final List<ProductInOrderDTO> products;

  final String id;

  get props => [
        userId,
        price,
        adress,
        orderState,
        orderedDate,
        deliveredDate,
        products,
        id
      ];

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderDTOBase with EquatableMixin {
  OrderDTOBase({
    this.userId,
    required this.price,
    required this.adress,
    required this.orderState,
    required this.orderedDate,
    this.deliveredDate,
    required this.products,
  });

  factory OrderDTOBase.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOBaseFromJson(json);

  final String? userId;

  final double price;

  final String adress;

  final WebOrdersOrderStateDTO orderState;

  final DateTime orderedDate;

  final DateTime? deliveredDate;

  final List<ProductInOrderDTO> products;

  get props =>
      [userId, price, adress, orderState, orderedDate, deliveredDate, products];

  Map<String, dynamic> toJson() => _$OrderDTOBaseToJson(this);
}

enum OrdersFilterFieldDTO {
  @JsonValue(0)
  orderState,
  @JsonValue(1)
  address,
  @JsonValue(2)
  userId
}

enum OrdersSortFieldDTO {
  @JsonValue(0)
  orderedDate,
  @JsonValue(1)
  deliveredDate
}

enum WebOrdersOrderStateDTO {
  @JsonValue(0)
  pending,
  @JsonValue(1)
  cancelled,
  @JsonValue(2)
  inProgress,
  @JsonValue(3)
  finished
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductInOrderDTO with EquatableMixin implements ProductDTO {
  ProductInOrderDTO({
    required this.name,
    required this.price,
    required this.description,
    this.averageRating,
    this.previewPhotoId,
    this.categoryId,
    required this.id,
    required this.amount,
  });

  factory ProductInOrderDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductInOrderDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final double? averageRating;

  final String? previewPhotoId;

  final String? categoryId;

  final String id;

  final int amount;

  get props => [
        name,
        price,
        description,
        averageRating,
        previewPhotoId,
        categoryId,
        id,
        amount
      ];

  Map<String, dynamic> toJson() => _$ProductInOrderDTOToJson(this);
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

  final WebOrdersOrderStateDTO orderState;

  get props => [id, orderState];

  Map<String, dynamic> toJson() => _$SetOrderStateToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Orders.SetOrderState';
}

class SetOrderStateErrorCodes {
  static const incorrectState = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllProducts
    with EquatableMixin
    implements SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?> {
  AllProducts({
    required this.pageNumber,
    required this.pageSize,
    this.filterBy,
    this.sortBy,
    required this.sortByDescending,
    this.categoryId,
  });

  factory AllProducts.fromJson(Map<String, dynamic> json) =>
      _$AllProductsFromJson(json);

  final int pageNumber;

  final int pageSize;

  final String? filterBy;

  final ProductsSortFieldDTO? sortBy;

  final bool sortByDescending;

  final String? categoryId;

  get props =>
      [pageNumber, pageSize, filterBy, sortBy, sortByDescending, categoryId];

  Map<String, dynamic> toJson() => _$AllProductsToJson(this);
  PaginatedResult<ProductDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ProductDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Products.AllProducts';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateProdcutDTO with EquatableMixin implements ProductDTOBase {
  CreateProdcutDTO({
    required this.name,
    required this.price,
    required this.description,
    this.averageRating,
    this.previewPhotoId,
    this.categoryId,
    this.modelId,
    required this.photoIds,
  });

  factory CreateProdcutDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateProdcutDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final double? averageRating;

  final String? previewPhotoId;

  final String? categoryId;

  final String? modelId;

  final List<String> photoIds;

  get props => [
        name,
        price,
        description,
        averageRating,
        previewPhotoId,
        categoryId,
        modelId,
        photoIds
      ];

  Map<String, dynamic> toJson() => _$CreateProdcutDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateProduct with EquatableMixin implements Command {
  CreateProduct({
    required this.newProduct,
  });

  factory CreateProduct.fromJson(Map<String, dynamic> json) =>
      _$CreateProductFromJson(json);

  final CreateProdcutDTO newProduct;

  get props => [newProduct];

  Map<String, dynamic> toJson() => _$CreateProductToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Products.CreateProduct';
}

class CreateProductErrorCodes {
  static const incorrectName = 1;

  static const incorrectDescription = 2;

  static const incorrectPrice = 3;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
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
      'FurnitureShop.Core.Contracts.Web.Products.DeleteProduct';
}

class DeleteProductErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductById with EquatableMixin implements Query<ProductDetailsDTO?> {
  ProductById({
    required this.id,
  });

  factory ProductById.fromJson(Map<String, dynamic> json) =>
      _$ProductByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ProductByIdToJson(this);
  ProductDetailsDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$ProductDetailsDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Products.ProductById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDetailsDTO with EquatableMixin implements ProductDTOBase {
  ProductDetailsDTO({
    required this.name,
    required this.price,
    required this.description,
    this.averageRating,
    this.previewPhotoId,
    this.categoryId,
    required this.id,
    this.modelId,
    required this.photosIds,
  });

  factory ProductDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final double? averageRating;

  final String? previewPhotoId;

  final String? categoryId;

  final String id;

  final String? modelId;

  final List<String> photosIds;

  get props => [
        name,
        price,
        description,
        averageRating,
        previewPhotoId,
        categoryId,
        id,
        modelId,
        photosIds
      ];

  Map<String, dynamic> toJson() => _$ProductDetailsDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDTO with EquatableMixin implements ProductDTOBase {
  ProductDTO({
    required this.name,
    required this.price,
    required this.description,
    this.averageRating,
    this.previewPhotoId,
    this.categoryId,
    required this.id,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final double? averageRating;

  final String? previewPhotoId;

  final String? categoryId;

  final String id;

  get props =>
      [name, price, description, averageRating, previewPhotoId, categoryId, id];

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateProduct with EquatableMixin implements Command {
  UpdateProduct({
    required this.updatedProduct,
  });

  factory UpdateProduct.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductFromJson(json);

  final ProductDetailsDTO updatedProduct;

  get props => [updatedProduct];

  Map<String, dynamic> toJson() => _$UpdateProductToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Products.UpdateProduct';
}

class UpdateProductErrorCodes {
  static const incorrectName = 1;

  static const incorrectDescription = 2;

  static const incorrectPrice = 3;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllReviewsForUser
    with EquatableMixin
    implements PaginatedQuery<ReviewDTO> {
  AllReviewsForUser({
    required this.pageNumber,
    required this.pageSize,
    required this.userId,
  });

  factory AllReviewsForUser.fromJson(Map<String, dynamic> json) =>
      _$AllReviewsForUserFromJson(json);

  final int pageNumber;

  final int pageSize;

  final String userId;

  get props => [pageNumber, pageSize, userId];

  Map<String, dynamic> toJson() => _$AllReviewsForUserToJson(this);
  PaginatedResult<ReviewDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ReviewDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Web.Reviews.AllReviewsForUser';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewDTO with EquatableMixin {
  ReviewDTO({
    required this.id,
    required this.userId,
    required this.userName,
    required this.productId,
    required this.productName,
    required this.text,
    required this.rating,
    required this.createdDate,
  });

  factory ReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDTOFromJson(json);

  final String id;

  final String userId;

  final String userName;

  final String productId;

  final String productName;

  final String text;

  final double rating;

  final DateTime createdDate;

  get props =>
      [id, userId, userName, productId, productName, text, rating, createdDate];

  Map<String, dynamic> toJson() => _$ReviewDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllUsers with EquatableMixin implements PaginatedQuery<UserInfoDTO> {
  AllUsers({
    required this.pageNumber,
    required this.pageSize,
  });

  factory AllUsers.fromJson(Map<String, dynamic> json) =>
      _$AllUsersFromJson(json);

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$AllUsersToJson(this);
  PaginatedResult<UserInfoDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$UserInfoDTOFromJson(e as Map<String, dynamic>));
  String getFullName() => 'FurnitureShop.Core.Contracts.Web.Users.AllUsers';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class BanUser with EquatableMixin implements Command {
  BanUser({
    required this.userId,
  });

  factory BanUser.fromJson(Map<String, dynamic> json) =>
      _$BanUserFromJson(json);

  final String userId;

  get props => [userId];

  Map<String, dynamic> toJson() => _$BanUserToJson(this);
  String getFullName() => 'FurnitureShop.Core.Contracts.Web.Users.BanUser';
}

class BanUserErrorCodes {
  static const userNotFound = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class UnbanUser with EquatableMixin implements Command {
  UnbanUser({
    required this.userId,
  });

  factory UnbanUser.fromJson(Map<String, dynamic> json) =>
      _$UnbanUserFromJson(json);

  final String userId;

  get props => [userId];

  Map<String, dynamic> toJson() => _$UnbanUserToJson(this);
  String getFullName() => 'FurnitureShop.Core.Contracts.Web.Users.UnbanUser';
}

class UnbanUserErrorCodes {
  static const userNotFound = 1;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserInfoDTO with EquatableMixin {
  UserInfoDTO({
    required this.id,
    required this.firstname,
    required this.surname,
    required this.username,
    required this.emailAddress,
    this.address,
    required this.funds,
    required this.isBanned,
  });

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);

  final String id;

  final String firstname;

  final String surname;

  final String username;

  final String emailAddress;

  final String? address;

  final int funds;

  final bool isBanned;

  get props => [
        id,
        firstname,
        surname,
        username,
        emailAddress,
        address,
        funds,
        isBanned
      ];

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}
