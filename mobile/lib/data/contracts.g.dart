// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => AddressDTO(
      id: json['Id'] as String,
      street: json['Street'] as String,
      city: json['City'] as String,
      state: json['State'] as String,
      postalCode: json['PostalCode'] as String,
      country: json['Country'] as String,
    );

Map<String, dynamic> _$AddressDTOToJson(AddressDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Street': instance.street,
      'City': instance.city,
      'State': instance.state,
      'PostalCode': instance.postalCode,
      'Country': instance.country,
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

OrderById _$OrderByIdFromJson(Map<String, dynamic> json) => OrderById(
      orderId: json['OrderId'] as String,
    );

Map<String, dynamic> _$OrderByIdToJson(OrderById instance) => <String, dynamic>{
      'OrderId': instance.orderId,
    };

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) => OrderDTO(
      id: json['Id'] as String,
      userId: json['UserId'] as String,
      price: (json['Price'] as num).toDouble(),
      deliveryAddress:
          AddressDTO.fromJson(json['DeliveryAddress'] as Map<String, dynamic>),
      orderedDate: DateTime.parse(json['OrderedDate'] as String),
      deliveredDate: json['DeliveredDate'] == null
          ? null
          : DateTime.parse(json['DeliveredDate'] as String),
      products: (json['Products'] as List<dynamic>)
          .map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'Price': instance.price,
      'DeliveryAddress': instance.deliveryAddress,
      'OrderedDate': instance.orderedDate.toIso8601String(),
      'DeliveredDate': instance.deliveredDate?.toIso8601String(),
      'Products': instance.products,
    };

CreateProduct _$CreateProductFromJson(Map<String, dynamic> json) =>
    CreateProduct(
      newProduct:
          ProductDTO.fromJson(json['NewProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductToJson(CreateProduct instance) =>
    <String, dynamic>{
      'NewProduct': instance.newProduct,
    };

ProductById _$ProductByIdFromJson(Map<String, dynamic> json) => ProductById(
      productId: json['ProductId'] as String,
    );

Map<String, dynamic> _$ProductByIdToJson(ProductById instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
    };

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['Id'] as String,
      description: json['Description'] as String,
      price: (json['Price'] as num).toDouble(),
      name: json['Name'] as String,
      modelUrl: json['ModelUrl'] as String?,
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Description': instance.description,
      'Price': instance.price,
      'Name': instance.name,
      'ModelUrl': instance.modelUrl,
    };

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) => RegisterUser(
      userInfo: UserDTO.fromJson(json['UserInfo'] as Map<String, dynamic>),
      password: json['Password'] as String,
    );

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'UserInfo': instance.userInfo,
      'Password': instance.password,
    };

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      firstname: json['Firstname'] as String,
      surname: json['Surname'] as String,
      username: json['Username'] as String,
      emailAddress: json['EmailAddress'] as String,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'EmailAddress': instance.emailAddress,
    };
