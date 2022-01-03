// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

CreateOrder _$CreateOrderFromJson(Map<String, dynamic> json) => CreateOrder(
      orderInfo:
          OrderInfoDTO.fromJson(json['OrderInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderToJson(CreateOrder instance) =>
    <String, dynamic>{
      'OrderInfo': instance.orderInfo,
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
      productId: json['ProductId'] as String?,
      amount: json['Amount'] as int,
    );

Map<String, dynamic> _$OrderProductDTOToJson(OrderProductDTO instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'Amount': instance.amount,
    };

CreateProduct _$CreateProductFromJson(Map<String, dynamic> json) =>
    CreateProduct(
      productInfo:
          ProductInfoDTO.fromJson(json['ProductInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductToJson(CreateProduct instance) =>
    <String, dynamic>{
      'ProductInfo': instance.productInfo,
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
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$GetAllProductsToJson(GetAllProducts instance) =>
    <String, dynamic>{
      'CategoryId': instance.categoryId,
    };

ProductById _$ProductByIdFromJson(Map<String, dynamic> json) => ProductById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ProductByIdToJson(ProductById instance) =>
    <String, dynamic>{
      'Id': instance.id,
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
      description: json['Description'] as String,
      price: (json['Price'] as num).toDouble(),
      name: json['Name'] as String,
      modelUrl: json['ModelUrl'] as String?,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$ProductInfoDTOToJson(ProductInfoDTO instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'Price': instance.price,
      'Name': instance.name,
      'ModelUrl': instance.modelUrl,
      'CategoryId': instance.categoryId,
    };

UpdateProduct _$UpdateProductFromJson(Map<String, dynamic> json) =>
    UpdateProduct(
      id: json['Id'] as String,
      productInfo:
          ProductInfoDTO.fromJson(json['ProductInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProductToJson(UpdateProduct instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProductInfo': instance.productInfo,
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
      productId: json['ProductId'] as String?,
      userId: json['UserId'] as String?,
    );

Map<String, dynamic> _$GetAllReviewsToJson(GetAllReviews instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'UserId': instance.userId,
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
