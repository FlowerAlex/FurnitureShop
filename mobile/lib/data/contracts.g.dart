// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintDTO _$ComplaintDTOFromJson(Map<String, dynamic> json) => ComplaintDTO(
      userId: json['UserId'] as String,
      orderId: json['OrderId'] as String,
      text: json['Text'] as String,
      response: json['Response'] as String?,
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      resolved: json['Resolved'] as bool,
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ComplaintDTOToJson(ComplaintDTO instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'OrderId': instance.orderId,
      'Text': instance.text,
      'Response': instance.response,
      'CreatedDate': instance.createdDate.toIso8601String(),
      'Resolved': instance.resolved,
      'Id': instance.id,
    };

ComplaintDTOBase _$ComplaintDTOBaseFromJson(Map<String, dynamic> json) =>
    ComplaintDTOBase(
      userId: json['UserId'] as String,
      orderId: json['OrderId'] as String,
      text: json['Text'] as String,
      response: json['Response'] as String?,
      createdDate: DateTime.parse(json['CreatedDate'] as String),
      resolved: json['Resolved'] as bool,
    );

Map<String, dynamic> _$ComplaintDTOBaseToJson(ComplaintDTOBase instance) =>
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
      complaintInfo: ComplaintDTOBase.fromJson(
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

MyComplaints _$MyComplaintsFromJson(Map<String, dynamic> json) => MyComplaints(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
    );

Map<String, dynamic> _$MyComplaintsToJson(MyComplaints instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
    };

UpdateComplaint _$UpdateComplaintFromJson(Map<String, dynamic> json) =>
    UpdateComplaint(
      updatedComplaint: ComplaintDTO.fromJson(
          json['UpdatedComplaint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateComplaintToJson(UpdateComplaint instance) =>
    <String, dynamic>{
      'UpdatedComplaint': instance.updatedComplaint,
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
  ProductsSortFieldDTO.price: 2,
};

CreateOrder _$CreateOrderFromJson(Map<String, dynamic> json) => CreateOrder(
      newOrder:
          CreateOrderDTO.fromJson(json['NewOrder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderToJson(CreateOrder instance) =>
    <String, dynamic>{
      'NewOrder': instance.newOrder,
    };

CreateOrderDTO _$CreateOrderDTOFromJson(Map<String, dynamic> json) =>
    CreateOrderDTO(
      address: json['Address'] as String?,
      products: (json['Products'] as List<dynamic>)
          .map((e) =>
              ProductInOrderCreateDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateOrderDTOToJson(CreateOrderDTO instance) =>
    <String, dynamic>{
      'Address': instance.address,
      'Products': instance.products,
    };

MyOrders _$MyOrdersFromJson(Map<String, dynamic> json) => MyOrders(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      filterBy: (json['FilterBy'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$MyOrdersFilterFieldDTOEnumMap, k), e as String),
      ),
      sortBy:
          $enumDecodeNullable(_$MyOrdersSortFieldDTOEnumMap, json['SortBy']),
      sortByDescending: json['SortByDescending'] as bool,
    );

Map<String, dynamic> _$MyOrdersToJson(MyOrders instance) => <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'FilterBy': instance.filterBy
          .map((k, e) => MapEntry(_$MyOrdersFilterFieldDTOEnumMap[k]!, e)),
      'SortBy': _$MyOrdersSortFieldDTOEnumMap[instance.sortBy],
      'SortByDescending': instance.sortByDescending,
    };

const _$MyOrdersFilterFieldDTOEnumMap = {
  MyOrdersFilterFieldDTO.orderState: 0,
};

const _$MyOrdersSortFieldDTOEnumMap = {
  MyOrdersSortFieldDTO.orderedDate: 0,
  MyOrdersSortFieldDTO.deliveredDate: 1,
};

OrderById _$OrderByIdFromJson(Map<String, dynamic> json) => OrderById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$OrderByIdToJson(OrderById instance) => <String, dynamic>{
      'Id': instance.id,
    };

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) => OrderDTO(
      id: json['Id'] as String,
      products: (json['Products'] as List<dynamic>)
          .map((e) => ProductInOrderDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['UserId'] as String?,
      price: (json['Price'] as num).toDouble(),
      address: json['Address'] as String,
      orderState: $enumDecode(_$OrderStateDTOEnumMap, json['OrderState']),
      orderedDate: DateTime.parse(json['OrderedDate'] as String),
      deliveredDate: json['DeliveredDate'] == null
          ? null
          : DateTime.parse(json['DeliveredDate'] as String),
    );

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'Id': instance.id,
      'Products': instance.products,
      'UserId': instance.userId,
      'Price': instance.price,
      'Address': instance.address,
      'OrderState': _$OrderStateDTOEnumMap[instance.orderState]!,
      'OrderedDate': instance.orderedDate.toIso8601String(),
      'DeliveredDate': instance.deliveredDate?.toIso8601String(),
    };

const _$OrderStateDTOEnumMap = {
  OrderStateDTO.pending: 0,
  OrderStateDTO.cancelled: 1,
  OrderStateDTO.inProgress: 2,
  OrderStateDTO.finished: 3,
};

ProductInOrderCreateDTO _$ProductInOrderCreateDTOFromJson(
        Map<String, dynamic> json) =>
    ProductInOrderCreateDTO(
      id: json['Id'] as String,
      amount: json['Amount'] as int,
    );

Map<String, dynamic> _$ProductInOrderCreateDTOToJson(
        ProductInOrderCreateDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Amount': instance.amount,
    };

ProductInOrderDTO _$ProductInOrderDTOFromJson(Map<String, dynamic> json) =>
    ProductInOrderDTO(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      description: json['Description'] as String,
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoId: json['PreviewPhotoId'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String,
      inFavourites: json['InFavourites'] as bool,
      inShoppingCart: json['InShoppingCart'] as bool,
      amount: json['Amount'] as int,
    );

Map<String, dynamic> _$ProductInOrderDTOToJson(ProductInOrderDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'Description': instance.description,
      'AverageRating': instance.averageRating,
      'PreviewPhotoId': instance.previewPhotoId,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
      'InFavourites': instance.inFavourites,
      'InShoppingCart': instance.inShoppingCart,
      'Amount': instance.amount,
    };

AddToFavourites _$AddToFavouritesFromJson(Map<String, dynamic> json) =>
    AddToFavourites(
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$AddToFavouritesToJson(AddToFavourites instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
    };

AllProducts _$AllProductsFromJson(Map<String, dynamic> json) => AllProducts(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      filterBy: json['FilterBy'] as String?,
      sortBy:
          $enumDecodeNullable(_$ProductsSortFieldDTOEnumMap, json['SortBy']),
      sortByDescending: json['SortByDescending'] as bool,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$AllProductsToJson(AllProducts instance) =>
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
      description: json['Description'] as String,
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoId: json['PreviewPhotoId'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String,
      inFavourites: json['InFavourites'] as bool,
      inShoppingCart: json['InShoppingCart'] as bool,
      modelId: json['ModelId'] as String?,
      photoIds:
          (json['PhotoIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductDetailsDTOToJson(ProductDetailsDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'Description': instance.description,
      'AverageRating': instance.averageRating,
      'PreviewPhotoId': instance.previewPhotoId,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
      'InFavourites': instance.inFavourites,
      'InShoppingCart': instance.inShoppingCart,
      'ModelId': instance.modelId,
      'PhotoIds': instance.photoIds,
    };

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      description: json['Description'] as String,
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoId: json['PreviewPhotoId'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String,
      inFavourites: json['InFavourites'] as bool,
      inShoppingCart: json['InShoppingCart'] as bool,
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'Description': instance.description,
      'AverageRating': instance.averageRating,
      'PreviewPhotoId': instance.previewPhotoId,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
      'InFavourites': instance.inFavourites,
      'InShoppingCart': instance.inShoppingCart,
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

AllReviews _$AllReviewsFromJson(Map<String, dynamic> json) => AllReviews(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$AllReviewsToJson(AllReviews instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'ProductId': instance.productId,
    };

CreateReview _$CreateReviewFromJson(Map<String, dynamic> json) => CreateReview(
      newReview:
          CreateReviewDTO.fromJson(json['NewReview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateReviewToJson(CreateReview instance) =>
    <String, dynamic>{
      'NewReview': instance.newReview,
    };

CreateReviewDTO _$CreateReviewDTOFromJson(Map<String, dynamic> json) =>
    CreateReviewDTO(
      productId: json['ProductId'] as String,
      text: json['Text'] as String,
      rating: (json['Rating'] as num).toDouble(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$CreateReviewDTOToJson(CreateReviewDTO instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'Text': instance.text,
      'Rating': instance.rating,
      'CreatedDate': instance.createdDate.toIso8601String(),
    };

DeleteReview _$DeleteReviewFromJson(Map<String, dynamic> json) => DeleteReview(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$DeleteReviewToJson(DeleteReview instance) =>
    <String, dynamic>{
      'Id': instance.id,
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
      userId: json['UserId'] as String,
      userName: json['UserName'] as String,
      productId: json['ProductId'] as String,
      text: json['Text'] as String,
      rating: (json['Rating'] as num).toDouble(),
      createdDate: DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$ReviewDTOToJson(ReviewDTO instance) => <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'UserName': instance.userName,
      'ProductId': instance.productId,
      'Text': instance.text,
      'Rating': instance.rating,
      'CreatedDate': instance.createdDate.toIso8601String(),
    };

UpdateReview _$UpdateReviewFromJson(Map<String, dynamic> json) => UpdateReview(
      updatedReview: UpdateReviewDTO.fromJson(
          json['UpdatedReview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateReviewToJson(UpdateReview instance) =>
    <String, dynamic>{
      'UpdatedReview': instance.updatedReview,
    };

UpdateReviewDTO _$UpdateReviewDTOFromJson(Map<String, dynamic> json) =>
    UpdateReviewDTO(
      id: json['Id'] as String,
      text: json['Text'] as String,
      rating: (json['Rating'] as num).toDouble(),
    );

Map<String, dynamic> _$UpdateReviewDTOToJson(UpdateReviewDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Text': instance.text,
      'Rating': instance.rating,
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
      price: (json['Price'] as num).toDouble(),
      shoppingCartProducts: (json['ShoppingCartProducts'] as List<dynamic>)
          .map(
              (e) => ShoppingCartProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingCartDTOToJson(ShoppingCartDTO instance) =>
    <String, dynamic>{
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
      userInfo:
          UserInfoDTOBase.fromJson(json['UserInfo'] as Map<String, dynamic>),
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
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$UpdateProfileToJson(UpdateProfile instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'Address': instance.address,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo();

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{};

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) => UserInfoDTO(
      firstname: json['Firstname'] as String,
      surname: json['Surname'] as String,
      username: json['Username'] as String,
      emailAddress: json['EmailAddress'] as String,
      address: json['Address'] as String,
      funds: json['Funds'] as int,
    );

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'EmailAddress': instance.emailAddress,
      'Address': instance.address,
      'Funds': instance.funds,
    };

UserInfoDTOBase _$UserInfoDTOBaseFromJson(Map<String, dynamic> json) =>
    UserInfoDTOBase(
      firstname: json['Firstname'] as String,
      surname: json['Surname'] as String,
      username: json['Username'] as String,
      emailAddress: json['EmailAddress'] as String,
      address: json['Address'] as String,
    );

Map<String, dynamic> _$UserInfoDTOBaseToJson(UserInfoDTOBase instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'EmailAddress': instance.emailAddress,
      'Address': instance.address,
    };

AllCategories _$AllCategoriesFromJson(Map<String, dynamic> json) =>
    AllCategories();

Map<String, dynamic> _$AllCategoriesToJson(AllCategories instance) =>
    <String, dynamic>{};

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      id: json['Id'] as String,
      name: json['Name'] as String,
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
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

ProductDTOBase _$ProductDTOBaseFromJson(Map<String, dynamic> json) =>
    ProductDTOBase(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      description: json['Description'] as String,
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoId: json['PreviewPhotoId'] as String?,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$ProductDTOBaseToJson(ProductDTOBase instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'Description': instance.description,
      'AverageRating': instance.averageRating,
      'PreviewPhotoId': instance.previewPhotoId,
      'CategoryId': instance.categoryId,
    };
