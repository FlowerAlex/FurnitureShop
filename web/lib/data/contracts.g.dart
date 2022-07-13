// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth();

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{};

Clients _$ClientsFromJson(Map<String, dynamic> json) => Clients();

Map<String, dynamic> _$ClientsToJson(Clients instance) => <String, dynamic>{};

KnownClaims _$KnownClaimsFromJson(Map<String, dynamic> json) => KnownClaims();

Map<String, dynamic> _$KnownClaimsToJson(KnownClaims instance) =>
    <String, dynamic>{};

Roles _$RolesFromJson(Map<String, dynamic> json) => Roles();

Map<String, dynamic> _$RolesToJson(Roles instance) => <String, dynamic>{};

Scopes _$ScopesFromJson(Map<String, dynamic> json) => Scopes();

Map<String, dynamic> _$ScopesToJson(Scopes instance) => <String, dynamic>{};

GetAllModelsUrls _$GetAllModelsUrlsFromJson(Map<String, dynamic> json) =>
    GetAllModelsUrls();

Map<String, dynamic> _$GetAllModelsUrlsToJson(GetAllModelsUrls instance) =>
    <String, dynamic>{};

GetAllPhotosUrls _$GetAllPhotosUrlsFromJson(Map<String, dynamic> json) =>
    GetAllPhotosUrls();

Map<String, dynamic> _$GetAllPhotosUrlsToJson(GetAllPhotosUrls instance) =>
    <String, dynamic>{};

GetModelUploadLink _$GetModelUploadLinkFromJson(Map<String, dynamic> json) =>
    GetModelUploadLink(
      blobName: json['BlobName'] as String,
    );

Map<String, dynamic> _$GetModelUploadLinkToJson(GetModelUploadLink instance) =>
    <String, dynamic>{
      'BlobName': instance.blobName,
    };

GetPhotoUploadLink _$GetPhotoUploadLinkFromJson(Map<String, dynamic> json) =>
    GetPhotoUploadLink(
      blobName: json['BlobName'] as String,
    );

Map<String, dynamic> _$GetPhotoUploadLinkToJson(GetPhotoUploadLink instance) =>
    <String, dynamic>{
      'BlobName': instance.blobName,
    };

CategoryById _$CategoryByIdFromJson(Map<String, dynamic> json) => CategoryById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$CategoryByIdToJson(CategoryById instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      id: json['Id'] as String,
      name: json['Name'] as String,
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
    };

CreateCategory _$CreateCategoryFromJson(Map<String, dynamic> json) =>
    CreateCategory(
      categoryName: json['CategoryName'] as String,
    );

Map<String, dynamic> _$CreateCategoryToJson(CreateCategory instance) =>
    <String, dynamic>{
      'CategoryName': instance.categoryName,
    };

DeleteCategory _$DeleteCategoryFromJson(Map<String, dynamic> json) =>
    DeleteCategory(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$DeleteCategoryToJson(DeleteCategory instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

GetAllCategories _$GetAllCategoriesFromJson(Map<String, dynamic> json) =>
    GetAllCategories();

Map<String, dynamic> _$GetAllCategoriesToJson(GetAllCategories instance) =>
    <String, dynamic>{};

UpdateCategory _$UpdateCategoryFromJson(Map<String, dynamic> json) =>
    UpdateCategory(
      id: json['Id'] as String,
      newName: json['NewName'] as String,
    );

Map<String, dynamic> _$UpdateCategoryToJson(UpdateCategory instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'NewName': instance.newName,
    };

ComplaintById _$ComplaintByIdFromJson(Map<String, dynamic> json) =>
    ComplaintById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ComplaintByIdToJson(ComplaintById instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

ComplaintDTO _$ComplaintDTOFromJson(Map<String, dynamic> json) => ComplaintDTO(
      id: json['Id'] as String,
      complaintInfo: ComplaintInfoDTO.fromJson(
          json['ComplaintInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComplaintDTOToJson(ComplaintDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ComplaintInfo': instance.complaintInfo,
    };

ComplaintInfoDTO _$ComplaintInfoDTOFromJson(Map<String, dynamic> json) =>
    ComplaintInfoDTO(
      userId: json['UserId'] as String?,
      orderId: json['OrderId'] as String?,
      text: json['Text'] as String,
      response: json['Response'] as String?,
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      resolved: json['Resolved'] as bool,
    );

Map<String, dynamic> _$ComplaintInfoDTOToJson(ComplaintInfoDTO instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'OrderId': instance.orderId,
      'Text': instance.text,
      'Response': instance.response,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'Resolved': instance.resolved,
    };

CreateComplaint _$CreateComplaintFromJson(Map<String, dynamic> json) =>
    CreateComplaint(
      complaintInfo: ComplaintInfoDTO.fromJson(
          json['ComplaintInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateComplaintToJson(CreateComplaint instance) =>
    <String, dynamic>{
      'ComplaintInfo': instance.complaintInfo,
    };

DeleteComplaint _$DeleteComplaintFromJson(Map<String, dynamic> json) =>
    DeleteComplaint(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$DeleteComplaintToJson(DeleteComplaint instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

GetAllComplaints _$GetAllComplaintsFromJson(Map<String, dynamic> json) =>
    GetAllComplaints(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
    );

Map<String, dynamic> _$GetAllComplaintsToJson(GetAllComplaints instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
    };

UpdateComplaint _$UpdateComplaintFromJson(Map<String, dynamic> json) =>
    UpdateComplaint(
      id: json['Id'] as String,
      complaintInfo: ComplaintInfoDTO.fromJson(
          json['ComplaintInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateComplaintToJson(UpdateComplaint instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ComplaintInfo': instance.complaintInfo,
    };

MyFavourites _$MyFavouritesFromJson(Map<String, dynamic> json) => MyFavourites(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      filterBy: json['FilterBy'] as String?,
      sortBy:
          $enumDecodeNullable(_$ProductsSortFieldDTOEnumMap, json['SortBy']),
      sortByDescending: json['SortByDescending'] as bool,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$MyFavouritesToJson(MyFavourites instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'FilterBy': instance.filterBy,
      'SortBy': _$ProductsSortFieldDTOEnumMap[instance.sortBy],
      'SortByDescending': instance.sortByDescending,
      'CategoryId': instance.categoryId,
    };

const _$ProductsSortFieldDTOEnumMap = {
  ProductsSortFieldDTO.name: 0,
  ProductsSortFieldDTO.rating: 1,
};

CreateOrder _$CreateOrderFromJson(Map<String, dynamic> json) => CreateOrder(
      orderInfo:
          OrderInfoDTO.fromJson(json['OrderInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderToJson(CreateOrder instance) =>
    <String, dynamic>{
      'OrderInfo': instance.orderInfo,
    };

GetAllOrders _$GetAllOrdersFromJson(Map<String, dynamic> json) => GetAllOrders(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      filterBy: (json['FilterBy'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$OrdersFilterFieldDTOEnumMap, k), e as String),
      ),
      sortBy: $enumDecodeNullable(_$OrdersSortFieldDTOEnumMap, json['SortBy']),
      sortByDescending: json['SortByDescending'] as bool,
    );

Map<String, dynamic> _$GetAllOrdersToJson(GetAllOrders instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'FilterBy': instance.filterBy
          .map((k, e) => MapEntry(_$OrdersFilterFieldDTOEnumMap[k], e)),
      'SortBy': _$OrdersSortFieldDTOEnumMap[instance.sortBy],
      'SortByDescending': instance.sortByDescending,
    };

const _$OrdersFilterFieldDTOEnumMap = {
  OrdersFilterFieldDTO.orderState: 0,
  OrdersFilterFieldDTO.country: 1,
  OrdersFilterFieldDTO.state: 2,
  OrdersFilterFieldDTO.city: 3,
  OrdersFilterFieldDTO.street: 4,
  OrdersFilterFieldDTO.postalCode: 5,
  OrdersFilterFieldDTO.userId: 6,
};

const _$OrdersSortFieldDTOEnumMap = {
  OrdersSortFieldDTO.orderedDate: 0,
  OrdersSortFieldDTO.deliveredDate: 1,
};

OrderById _$OrderByIdFromJson(Map<String, dynamic> json) => OrderById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$OrderByIdToJson(OrderById instance) => <String, dynamic>{
      'Id': instance.id,
    };

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) => OrderDTO(
      id: json['Id'] as String,
      orderInfo:
          OrderInfoDTO.fromJson(json['OrderInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'Id': instance.id,
      'OrderInfo': instance.orderInfo,
    };

OrderInfoDTO _$OrderInfoDTOFromJson(Map<String, dynamic> json) => OrderInfoDTO(
      userId: json['UserId'] as String?,
      price: (json['Price'] as num).toDouble(),
      street: json['Street'] as String,
      city: json['City'] as String,
      state: json['State'] as String,
      postalCode: json['PostalCode'] as String,
      country: json['Country'] as String,
      orderState: json['OrderState'] as String,
      orderedDate: DateTime.parse(json['OrderedDate'] as String),
      deliveredDate: json['DeliveredDate'] == null
          ? null
          : DateTime.parse(json['DeliveredDate'] as String),
      orderProducts: (json['OrderProducts'] as List<dynamic>)
          .map((e) => OrderProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderInfoDTOToJson(OrderInfoDTO instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Price': instance.price,
      'Street': instance.street,
      'City': instance.city,
      'State': instance.state,
      'PostalCode': instance.postalCode,
      'Country': instance.country,
      'OrderState': instance.orderState,
      'OrderedDate': instance.orderedDate.toIso8601String(),
      'DeliveredDate': instance.deliveredDate?.toIso8601String(),
      'OrderProducts': instance.orderProducts,
    };

OrderProductDTO _$OrderProductDTOFromJson(Map<String, dynamic> json) =>
    OrderProductDTO(
      orderId: json['OrderId'] as String,
      product: ProductDTO.fromJson(json['Product'] as Map<String, dynamic>),
      amount: json['Amount'] as int,
    );

Map<String, dynamic> _$OrderProductDTOToJson(OrderProductDTO instance) =>
    <String, dynamic>{
      'OrderId': instance.orderId,
      'Product': instance.product,
      'Amount': instance.amount,
    };

SetOrderState _$SetOrderStateFromJson(Map<String, dynamic> json) =>
    SetOrderState(
      id: json['Id'] as String,
      orderState: json['OrderState'] as String,
    );

Map<String, dynamic> _$SetOrderStateToJson(SetOrderState instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'OrderState': instance.orderState,
    };

AddToFavourites _$AddToFavouritesFromJson(Map<String, dynamic> json) =>
    AddToFavourites(
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$AddToFavouritesToJson(AddToFavourites instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
    };

CreateProduct _$CreateProductFromJson(Map<String, dynamic> json) =>
    CreateProduct(
      productDetails: ProductDetailsDTO.fromJson(
          json['ProductDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductToJson(CreateProduct instance) =>
    <String, dynamic>{
      'ProductDetails': instance.productDetails,
    };

DeleteProduct _$DeleteProductFromJson(Map<String, dynamic> json) =>
    DeleteProduct(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$DeleteProductToJson(DeleteProduct instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

GetAllProducts _$GetAllProductsFromJson(Map<String, dynamic> json) =>
    GetAllProducts(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      filterBy: json['FilterBy'] as String?,
      sortBy:
          $enumDecodeNullable(_$ProductsSortFieldDTOEnumMap, json['SortBy']),
      sortByDescending: json['SortByDescending'] as bool,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$GetAllProductsToJson(GetAllProducts instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'FilterBy': instance.filterBy,
      'SortBy': _$ProductsSortFieldDTOEnumMap[instance.sortBy],
      'SortByDescending': instance.sortByDescending,
      'CategoryId': instance.categoryId,
    };

ProductById _$ProductByIdFromJson(Map<String, dynamic> json) => ProductById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ProductByIdToJson(ProductById instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

ProductDetailsDTO _$ProductDetailsDTOFromJson(Map<String, dynamic> json) =>
    ProductDetailsDTO(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoURL: json['PreviewPhotoURL'] as String?,
      inFavourites: json['InFavourites'] as bool,
      inShoppingCart: json['InShoppingCart'] as bool,
      categoryId: json['CategoryId'] as String?,
      description: json['Description'] as String,
      modelUrl: json['ModelUrl'] as String?,
    );

Map<String, dynamic> _$ProductDetailsDTOToJson(ProductDetailsDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'AverageRating': instance.averageRating,
      'PreviewPhotoURL': instance.previewPhotoURL,
      'InFavourites': instance.inFavourites,
      'InShoppingCart': instance.inShoppingCart,
      'CategoryId': instance.categoryId,
      'Description': instance.description,
      'ModelUrl': instance.modelUrl,
    };

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['Id'] as String,
      productInfo:
          ProductInfoDTO.fromJson(json['ProductInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProductInfo': instance.productInfo,
    };

ProductInfoDTO _$ProductInfoDTOFromJson(Map<String, dynamic> json) =>
    ProductInfoDTO(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoURL: json['PreviewPhotoURL'] as String?,
      inFavourites: json['InFavourites'] as bool,
      inShoppingCart: json['InShoppingCart'] as bool,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$ProductInfoDTOToJson(ProductInfoDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'AverageRating': instance.averageRating,
      'PreviewPhotoURL': instance.previewPhotoURL,
      'InFavourites': instance.inFavourites,
      'InShoppingCart': instance.inShoppingCart,
      'CategoryId': instance.categoryId,
    };

ProductWithDetailsDTO _$ProductWithDetailsDTOFromJson(
        Map<String, dynamic> json) =>
    ProductWithDetailsDTO(
      id: json['Id'] as String,
      productDetails: ProductDetailsDTO.fromJson(
          json['ProductDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductWithDetailsDTOToJson(
        ProductWithDetailsDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProductDetails': instance.productDetails,
    };

RemoveFromFavourites _$RemoveFromFavouritesFromJson(
        Map<String, dynamic> json) =>
    RemoveFromFavourites(
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$RemoveFromFavouritesToJson(
        RemoveFromFavourites instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
    };

UpdateProduct _$UpdateProductFromJson(Map<String, dynamic> json) =>
    UpdateProduct(
      id: json['Id'] as String,
      productDetails: ProductDetailsDTO.fromJson(
          json['ProductDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProductToJson(UpdateProduct instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProductDetails': instance.productDetails,
    };

CreateReview _$CreateReviewFromJson(Map<String, dynamic> json) => CreateReview(
      reviewInfo:
          ReviewInfoDTO.fromJson(json['ReviewInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateReviewToJson(CreateReview instance) =>
    <String, dynamic>{
      'ReviewInfo': instance.reviewInfo,
    };

DeleteReview _$DeleteReviewFromJson(Map<String, dynamic> json) => DeleteReview(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$DeleteReviewToJson(DeleteReview instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

GetAllReviews _$GetAllReviewsFromJson(Map<String, dynamic> json) =>
    GetAllReviews(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$GetAllReviewsToJson(GetAllReviews instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'ProductId': instance.productId,
    };

ReviewById _$ReviewByIdFromJson(Map<String, dynamic> json) => ReviewById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ReviewByIdToJson(ReviewById instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

ReviewDTO _$ReviewDTOFromJson(Map<String, dynamic> json) => ReviewDTO(
      id: json['Id'] as String,
      reviewInfo:
          ReviewInfoDTO.fromJson(json['ReviewInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewDTOToJson(ReviewDTO instance) => <String, dynamic>{
      'Id': instance.id,
      'ReviewInfo': instance.reviewInfo,
    };

ReviewInfoDTO _$ReviewInfoDTOFromJson(Map<String, dynamic> json) =>
    ReviewInfoDTO(
      userId: json['UserId'] as String?,
      productId: json['ProductId'] as String?,
      text: json['Text'] as String,
      rating: (json['Rating'] as num).toDouble(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$ReviewInfoDTOToJson(ReviewInfoDTO instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'ProductId': instance.productId,
      'Text': instance.text,
      'Rating': instance.rating,
      'CreatedDate': instance.createdDate.toIso8601String(),
    };

UpdateReview _$UpdateReviewFromJson(Map<String, dynamic> json) => UpdateReview(
      id: json['Id'] as String,
      reviewInfo:
          ReviewInfoDTO.fromJson(json['ReviewInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateReviewToJson(UpdateReview instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ReviewInfo': instance.reviewInfo,
    };

AddProductsToShoppingCart _$AddProductsToShoppingCartFromJson(
        Map<String, dynamic> json) =>
    AddProductsToShoppingCart(
      productId: json['ProductId'] as String,
      amount: json['Amount'] as int,
    );

Map<String, dynamic> _$AddProductsToShoppingCartToJson(
        AddProductsToShoppingCart instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'Amount': instance.amount,
    };

ChangeProductAmount _$ChangeProductAmountFromJson(Map<String, dynamic> json) =>
    ChangeProductAmount(
      productId: json['ProductId'] as String,
      newAmount: json['NewAmount'] as int,
    );

Map<String, dynamic> _$ChangeProductAmountToJson(
        ChangeProductAmount instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'NewAmount': instance.newAmount,
    };

RemoveProductFromShoppingCart _$RemoveProductFromShoppingCartFromJson(
        Map<String, dynamic> json) =>
    RemoveProductFromShoppingCart(
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$RemoveProductFromShoppingCartToJson(
        RemoveProductFromShoppingCart instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
    };

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) =>
    ShoppingCart();

Map<String, dynamic> _$ShoppingCartToJson(ShoppingCart instance) =>
    <String, dynamic>{};

ShoppingCartDTO _$ShoppingCartDTOFromJson(Map<String, dynamic> json) =>
    ShoppingCartDTO(
      userId: json['UserId'] as String?,
      price: (json['Price'] as num).toDouble(),
      shoppingCartProducts: (json['ShoppingCartProducts'] as List<dynamic>)
          .map(
              (e) => ShoppingCartProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingCartDTOToJson(ShoppingCartDTO instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Price': instance.price,
      'ShoppingCartProducts': instance.shoppingCartProducts,
    };

ShoppingCartProductDTO _$ShoppingCartProductDTOFromJson(
        Map<String, dynamic> json) =>
    ShoppingCartProductDTO(
      amount: json['Amount'] as int,
      product: ProductDTO.fromJson(json['Product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShoppingCartProductDTOToJson(
        ShoppingCartProductDTO instance) =>
    <String, dynamic>{
      'Amount': instance.amount,
      'Product': instance.product,
    };

AddFunds _$AddFundsFromJson(Map<String, dynamic> json) => AddFunds(
      fundsToAdd: json['FundsToAdd'] as int,
    );

Map<String, dynamic> _$AddFundsToJson(AddFunds instance) => <String, dynamic>{
      'FundsToAdd': instance.fundsToAdd,
    };

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) => RegisterUser(
      userInfo: UserInfoDTO.fromJson(json['UserInfo'] as Map<String, dynamic>),
      password: json['Password'] as String,
    );

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'UserInfo': instance.userInfo,
      'Password': instance.password,
    };

UpdateProfile _$UpdateProfileFromJson(Map<String, dynamic> json) =>
    UpdateProfile(
      firstname: json['Firstname'] as String?,
      surname: json['Surname'] as String?,
      username: json['Username'] as String?,
    );

Map<String, dynamic> _$UpdateProfileToJson(UpdateProfile instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo();

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{};

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) => UserInfoDTO(
      firstname: json['Firstname'] as String,
      surname: json['Surname'] as String,
      username: json['Username'] as String,
      emailAddress: json['EmailAddress'] as String,
    );

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'EmailAddress': instance.emailAddress,
    };

PaginatedResult<TResult> _$PaginatedResultFromJson<TResult>(
  Map<String, dynamic> json,
  TResult Function(Object? json) fromJsonTResult,
) =>
    PaginatedResult<TResult>(
      items: (json['Items'] as List<dynamic>).map(fromJsonTResult).toList(),
      totalCount: json['TotalCount'] as int,
    );

Map<String, dynamic> _$PaginatedResultToJson<TResult>(
  PaginatedResult<TResult> instance,
  Object? Function(TResult value) toJsonTResult,
) =>
    <String, dynamic>{
      'Items': instance.items.map(toJsonTResult).toList(),
      'TotalCount': instance.totalCount,
    };
