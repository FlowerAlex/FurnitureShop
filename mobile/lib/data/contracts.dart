// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
part 'contracts.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintDTO with EquatableMixin implements ComplaintDTOBase {
  ComplaintDTO({
    required this.orderId,
    required this.text,
    required this.userId,
    this.response,
    required this.resolved,
    required this.id,
    required this.createdDate,
  });

  factory ComplaintDTO.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDTOFromJson(json);

  final String orderId;

  final String text;

  final String userId;

  final String? response;

  final bool resolved;

  final String id;

  final DateTime createdDate;

  get props => [orderId, text, userId, response, resolved, id, createdDate];

  Map<String, dynamic> toJson() => _$ComplaintDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ComplaintDTOBase with EquatableMixin {
  ComplaintDTOBase({
    required this.orderId,
    required this.text,
  });

  factory ComplaintDTOBase.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDTOBaseFromJson(json);

  final String orderId;

  final String text;

  get props => [orderId, text];

  Map<String, dynamic> toJson() => _$ComplaintDTOBaseToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateComplaint with EquatableMixin implements Command {
  CreateComplaint({
    required this.complaintInfo,
  });

  factory CreateComplaint.fromJson(Map<String, dynamic> json) =>
      _$CreateComplaintFromJson(json);

  final ComplaintDTOBase complaintInfo;

  get props => [complaintInfo];

  Map<String, dynamic> toJson() => _$CreateComplaintToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.CreateComplaint';
}

class CreateComplaintErrorCodes {
  static const emptyComplaintText = 1;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class MyComplaints with EquatableMixin implements PaginatedQuery<ComplaintDTO> {
  MyComplaints({
    required this.pageNumber,
    required this.pageSize,
  });

  factory MyComplaints.fromJson(Map<String, dynamic> json) =>
      _$MyComplaintsFromJson(json);

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$MyComplaintsToJson(this);
  PaginatedResult<ComplaintDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ComplaintDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.MyComplaints';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ResolveComplaint with EquatableMixin implements Command {
  ResolveComplaint({
    required this.id,
  });

  factory ResolveComplaint.fromJson(Map<String, dynamic> json) =>
      _$ResolveComplaintFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ResolveComplaintToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.ResolveComplaint';
}

class ResolveComplaintErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user', 'admin')
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateComplaint with EquatableMixin implements Command {
  UpdateComplaint({
    required this.updatedComplaint,
  });

  factory UpdateComplaint.fromJson(Map<String, dynamic> json) =>
      _$UpdateComplaintFromJson(json);

  final UpdateComplaintDTO updatedComplaint;

  get props => [updatedComplaint];

  Map<String, dynamic> toJson() => _$UpdateComplaintToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Complaints.UpdateComplaint';
}

class UpdateComplaintErrorCodes {
  static const emptyComplaintText = 1;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateComplaintDTO with EquatableMixin {
  UpdateComplaintDTO({
    required this.id,
    required this.text,
  });

  factory UpdateComplaintDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateComplaintDTOFromJson(json);

  final String id;

  final String text;

  get props => [id, text];

  Map<String, dynamic> toJson() => _$UpdateComplaintDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class MyFavourites
    with EquatableMixin
    implements SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?> {
  MyFavourites({
    required this.pageNumber,
    required this.pageSize,
    this.filterBy,
    this.sortBy,
    required this.sortByDescending,
    this.categoryId,
  });

  factory MyFavourites.fromJson(Map<String, dynamic> json) =>
      _$MyFavouritesFromJson(json);

  final int pageNumber;

  final int pageSize;

  final String? filterBy;

  final ProductsSortFieldDTO? sortBy;

  final bool sortByDescending;

  final String? categoryId;

  get props =>
      [pageNumber, pageSize, filterBy, sortBy, sortByDescending, categoryId];

  Map<String, dynamic> toJson() => _$MyFavouritesToJson(this);
  PaginatedResult<ProductDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$ProductDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Favourites.MyFavourites';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateOrder with EquatableMixin implements Command {
  CreateOrder({
    required this.newOrder,
  });

  factory CreateOrder.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderFromJson(json);

  final CreateOrderDTO newOrder;

  get props => [newOrder];

  Map<String, dynamic> toJson() => _$CreateOrderToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Orders.CreateOrder';
}

class CreateOrderErrorCodes {
  static const noProducts = 1;

  static const incorrectAddress = 2;

  static const notEnoughFunds = 3;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateOrderDTO with EquatableMixin {
  CreateOrderDTO({
    this.address,
    required this.products,
  });

  factory CreateOrderDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderDTOFromJson(json);

  final String? address;

  final List<ProductInOrderCreateDTO> products;

  get props => [address, products];

  Map<String, dynamic> toJson() => _$CreateOrderDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class MyOrders
    with
        EquatableMixin
    implements
        SortableMulitiFilterPaginatedQuery<OrderDTO, MyOrdersSortFieldDTO?,
            MyOrdersFilterFieldDTO> {
  MyOrders({
    required this.pageNumber,
    required this.pageSize,
    required this.filterBy,
    this.sortBy,
    required this.sortByDescending,
  });

  factory MyOrders.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersFromJson(json);

  final int pageNumber;

  final int pageSize;

  final Map<MyOrdersFilterFieldDTO, String> filterBy;

  final MyOrdersSortFieldDTO? sortBy;

  final bool sortByDescending;

  get props => [pageNumber, pageSize, filterBy, sortBy, sortByDescending];

  Map<String, dynamic> toJson() => _$MyOrdersToJson(this);
  PaginatedResult<OrderDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$OrderDTOFromJson(e as Map<String, dynamic>));
  String getFullName() => 'FurnitureShop.Core.Contracts.Mobile.Orders.MyOrders';
}

enum MyOrdersFilterFieldDTO {
  @JsonValue(0)
  orderState
}

enum MyOrdersSortFieldDTO {
  @JsonValue(0)
  orderedDate,
  @JsonValue(1)
  deliveredDate
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
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
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Orders.OrderById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderDTO with EquatableMixin {
  OrderDTO({
    required this.id,
    required this.products,
    this.userId,
    required this.price,
    required this.address,
    this.complaint,
    required this.orderState,
    required this.orderedDate,
    this.deliveredDate,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);

  final String id;

  final List<ProductInOrderDTO> products;

  final String? userId;

  final double price;

  final String address;

  final ComplaintDTO? complaint;

  final OrderStateDTO orderState;

  final DateTime orderedDate;

  final DateTime? deliveredDate;

  get props => [
        id,
        products,
        userId,
        price,
        address,
        complaint,
        orderState,
        orderedDate,
        deliveredDate
      ];

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductInOrderCreateDTO with EquatableMixin {
  ProductInOrderCreateDTO({
    required this.id,
    required this.amount,
  });

  factory ProductInOrderCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductInOrderCreateDTOFromJson(json);

  final String id;

  final int amount;

  get props => [id, amount];

  Map<String, dynamic> toJson() => _$ProductInOrderCreateDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductInOrderDTO with EquatableMixin implements ProductDTO {
  ProductInOrderDTO({
    required this.name,
    required this.price,
    required this.description,
    this.previewPhotoId,
    this.categoryId,
    required this.id,
    required this.inFavourites,
    required this.inShoppingCart,
    this.averageRating,
    required this.amount,
  });

  factory ProductInOrderDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductInOrderDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final String? previewPhotoId;

  final String? categoryId;

  final String id;

  final bool inFavourites;

  final bool inShoppingCart;

  final double? averageRating;

  final int amount;

  get props => [
        name,
        price,
        description,
        previewPhotoId,
        categoryId,
        id,
        inFavourites,
        inShoppingCart,
        averageRating,
        amount
      ];

  Map<String, dynamic> toJson() => _$ProductInOrderDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AddToFavourites with EquatableMixin implements Command {
  AddToFavourites({
    required this.productId,
  });

  factory AddToFavourites.fromJson(Map<String, dynamic> json) =>
      _$AddToFavouritesFromJson(json);

  final String productId;

  get props => [productId];

  Map<String, dynamic> toJson() => _$AddToFavouritesToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.AddToFavourites';
}

class AddToFavouritesErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
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
      'FurnitureShop.Core.Contracts.Mobile.Products.AllProducts';
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
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
      'FurnitureShop.Core.Contracts.Mobile.Products.ProductById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDetailsDTO with EquatableMixin implements ProductDTO {
  ProductDetailsDTO({
    required this.name,
    required this.price,
    required this.description,
    this.previewPhotoId,
    this.categoryId,
    required this.id,
    required this.inFavourites,
    required this.inShoppingCart,
    this.averageRating,
    this.modelId,
    required this.photoIds,
  });

  factory ProductDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final String? previewPhotoId;

  final String? categoryId;

  final String id;

  final bool inFavourites;

  final bool inShoppingCart;

  final double? averageRating;

  final String? modelId;

  final List<String> photoIds;

  get props => [
        name,
        price,
        description,
        previewPhotoId,
        categoryId,
        id,
        inFavourites,
        inShoppingCart,
        averageRating,
        modelId,
        photoIds
      ];

  Map<String, dynamic> toJson() => _$ProductDetailsDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductDTO with EquatableMixin implements ProductDTOBase {
  ProductDTO({
    required this.name,
    required this.price,
    required this.description,
    this.previewPhotoId,
    this.categoryId,
    required this.id,
    required this.inFavourites,
    required this.inShoppingCart,
    this.averageRating,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  final String name;

  final double price;

  final String description;

  final String? previewPhotoId;

  final String? categoryId;

  final String id;

  final bool inFavourites;

  final bool inShoppingCart;

  final double? averageRating;

  get props => [
        name,
        price,
        description,
        previewPhotoId,
        categoryId,
        id,
        inFavourites,
        inShoppingCart,
        averageRating
      ];

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class RemoveFromFavourites with EquatableMixin implements Command {
  RemoveFromFavourites({
    required this.productId,
  });

  factory RemoveFromFavourites.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromFavouritesFromJson(json);

  final String productId;

  get props => [productId];

  Map<String, dynamic> toJson() => _$RemoveFromFavouritesToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Products.RemoveFromFavourites';
}

class RemoveFromFavouritesErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AddReview with EquatableMixin implements Command {
  AddReview({
    required this.reviewData,
  });

  factory AddReview.fromJson(Map<String, dynamic> json) =>
      _$AddReviewFromJson(json);

  final ReviewDataDTO reviewData;

  get props => [reviewData];

  Map<String, dynamic> toJson() => _$AddReviewToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.AddReview';
}

class AddReviewErrorCodes {
  static const emptyReviewText = 1;

  static const incorrectRating = 2;
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AllReviews with EquatableMixin implements Query<AllReviewsDTO> {
  AllReviews({
    required this.productId,
    required this.pageNumber,
    required this.pageSize,
  });

  factory AllReviews.fromJson(Map<String, dynamic> json) =>
      _$AllReviewsFromJson(json);

  final String productId;

  final int pageNumber;

  final int pageSize;

  get props => [productId, pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$AllReviewsToJson(this);
  AllReviewsDTO resultFactory(dynamic decodedJson) =>
      _$AllReviewsDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.AllReviews';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class AllReviewsDTO with EquatableMixin implements PaginatedResult<ReviewDTO> {
  AllReviewsDTO({
    required this.items,
    required this.totalCount,
    this.myReviewData,
  });

  factory AllReviewsDTO.fromJson(Map<String, dynamic> json) =>
      _$AllReviewsDTOFromJson(json);

  final List<ReviewDTO> items;

  final int totalCount;

  final ReviewDataDTO? myReviewData;

  get props => [items, totalCount, myReviewData];

  Map<String, dynamic> toJson() => _$AllReviewsDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
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
class ReviewById with EquatableMixin implements Query<ReviewDTO?> {
  ReviewById({
    required this.id,
  });

  factory ReviewById.fromJson(Map<String, dynamic> json) =>
      _$ReviewByIdFromJson(json);

  final String id;

  get props => [id];

  Map<String, dynamic> toJson() => _$ReviewByIdToJson(this);
  ReviewDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$ReviewDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.Reviews.ReviewById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewDataDTO with EquatableMixin {
  ReviewDataDTO({
    required this.productId,
    required this.text,
    required this.rating,
    required this.createdDate,
  });

  factory ReviewDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataDTOFromJson(json);

  final String productId;

  final String text;

  final double rating;

  final DateTime createdDate;

  get props => [productId, text, rating, createdDate];

  Map<String, dynamic> toJson() => _$ReviewDataDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ReviewDTO with EquatableMixin implements ReviewDataDTO {
  ReviewDTO({
    required this.productId,
    required this.text,
    required this.rating,
    required this.createdDate,
    required this.id,
    required this.userId,
    required this.userName,
  });

  factory ReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDTOFromJson(json);

  final String productId;

  final String text;

  final double rating;

  final DateTime createdDate;

  final String id;

  final String userId;

  final String userName;

  get props => [productId, text, rating, createdDate, id, userId, userName];

  Map<String, dynamic> toJson() => _$ReviewDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateReviewDTO with EquatableMixin {
  UpdateReviewDTO({
    required this.id,
    required this.text,
    required this.rating,
  });

  factory UpdateReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateReviewDTOFromJson(json);

  final String id;

  final String text;

  final double rating;

  get props => [id, text, rating];

  Map<String, dynamic> toJson() => _$UpdateReviewDTOToJson(this);
}

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
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ChangeProductAmount with EquatableMixin implements Command {
  ChangeProductAmount({
    required this.productId,
    required this.newAmount,
  });

  factory ChangeProductAmount.fromJson(Map<String, dynamic> json) =>
      _$ChangeProductAmountFromJson(json);

  final String productId;

  final int newAmount;

  get props => [productId, newAmount];

  Map<String, dynamic> toJson() => _$ChangeProductAmountToJson(this);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.ShoppingCart.ChangeProductAmount';
}

class ChangeProductAmountErrorCodes {
  static const incorrectAmount = 1;
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

class RemoveProductFromShoppingCartErrorCodes {}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCart with EquatableMixin implements Query<ShoppingCartDTO?> {
  ShoppingCart();

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);
  ShoppingCartDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$ShoppingCartDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'FurnitureShop.Core.Contracts.Mobile.ShoppingCart.ShoppingCart';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCartDTO with EquatableMixin {
  ShoppingCartDTO({
    required this.price,
    required this.shoppingCartProducts,
  });

  factory ShoppingCartDTO.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartDTOFromJson(json);

  final double price;

  final List<ShoppingCartProductDTO> shoppingCartProducts;

  get props => [price, shoppingCartProducts];

  Map<String, dynamic> toJson() => _$ShoppingCartDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ShoppingCartProductDTO with EquatableMixin {
  ShoppingCartProductDTO({
    required this.amount,
    required this.product,
  });

  factory ShoppingCartProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartProductDTOFromJson(json);

  final int amount;

  final ProductDTO product;

  get props => [amount, product];

  Map<String, dynamic> toJson() => _$ShoppingCartProductDTOToJson(this);
}

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class AddFunds with EquatableMixin implements Command {
  AddFunds({
    required this.fundsToAdd,
  });

  factory AddFunds.fromJson(Map<String, dynamic> json) =>
      _$AddFundsFromJson(json);

  final int fundsToAdd;

  get props => [fundsToAdd];

  Map<String, dynamic> toJson() => _$AddFundsToJson(this);
  String getFullName() => 'FurnitureShop.Core.Contracts.Mobile.Users.AddFunds';
}

class AddFundsErrorCodes {
  static const incorrectAmount = 1;
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

  final UserInfoDTOBase userInfo;

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

/// LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute('user')
@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateProfile with EquatableMixin implements Command {
  UpdateProfile({
    this.firstname,
    this.surname,
    this.username,
    this.address,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileFromJson(json);

  final String? firstname;

  final String? surname;

  final String? username;

  final String? address;

  get props => [firstname, surname, username, address];

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
class UserInfoDTO with EquatableMixin implements UserInfoDTOBase {
  UserInfoDTO({
    required this.firstname,
    required this.surname,
    required this.username,
    required this.emailAddress,
    required this.address,
    required this.userId,
    required this.funds,
  });

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);

  final String firstname;

  final String surname;

  final String username;

  final String emailAddress;

  final String address;

  final String userId;

  final int funds;

  get props =>
      [firstname, surname, username, emailAddress, address, userId, funds];

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserInfoDTOBase with EquatableMixin {
  UserInfoDTOBase({
    required this.firstname,
    required this.surname,
    required this.username,
    required this.emailAddress,
    required this.address,
  });

  factory UserInfoDTOBase.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOBaseFromJson(json);

  final String firstname;

  final String surname;

  final String username;

  final String emailAddress;

  final String address;

  get props => [firstname, surname, username, emailAddress, address];

  Map<String, dynamic> toJson() => _$UserInfoDTOBaseToJson(this);
}

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

enum OrderStateDTO {
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
    this.previewPhotoId,
    this.categoryId,
  });

  factory ProductDTOBase.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOBaseFromJson(json);

  final String name;

  final double price;

  final String description;

  final String? previewPhotoId;

  final String? categoryId;

  get props => [name, price, description, previewPhotoId, categoryId];

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
