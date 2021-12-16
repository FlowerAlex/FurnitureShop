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

@JsonSerializable(fieldRename: FieldRename.pascal)
class AddressDTO with EquatableMixin {
  AddressDTO({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  final String id;

  final String street;

  final String city;

  final String state;

  final String postalCode;

  final String country;

  get props => [id, street, city, state, postalCode, country];

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);
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

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
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
class OrderById with EquatableMixin implements IRemoteQuery<OrderDTO> {
  OrderById({
    required this.orderId,
  });

  factory OrderById.fromJson(Map<String, dynamic> json) =>
      _$OrderByIdFromJson(json);

  final String orderId;

  get props => [orderId];

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
    required this.userId,
    required this.price,
    required this.deliveryAddress,
    required this.orderedDate,
    this.deliveredDate,
    required this.products,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);

  final String id;

  final String userId;

  final double price;

  final AddressDTO deliveryAddress;

  final DateTime orderedDate;

  final DateTime? deliveredDate;

  final List<ProductDTO> products;

  get props => [
        id,
        userId,
        price,
        deliveryAddress,
        orderedDate,
        deliveredDate,
        products
      ];

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateProduct with EquatableMixin implements IRemoteCommand {
  CreateProduct({
    required this.newProduct,
  });

  factory CreateProduct.fromJson(Map<String, dynamic> json) =>
      _$CreateProductFromJson(json);

  final ProductDTO newProduct;

  get props => [newProduct];

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
class ProductById with EquatableMixin implements IRemoteQuery<ProductDTO> {
  ProductById({
    required this.productId,
  });

  factory ProductById.fromJson(Map<String, dynamic> json) =>
      _$ProductByIdFromJson(json);

  final String productId;

  get props => [productId];

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
    required this.description,
    required this.price,
    required this.name,
    this.modelUrl,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  final String id;

  final String description;

  final double price;

  final String name;

  final String? modelUrl;

  get props => [id, description, price, name, modelUrl];

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class RegisterUser with EquatableMixin implements IRemoteCommand {
  RegisterUser({
    required this.userInfo,
    required this.password,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);

  final UserDTO userInfo;

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
class UserDTO with EquatableMixin {
  UserDTO({
    required this.firstname,
    required this.surname,
    required this.username,
    required this.emailAddress,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  final String firstname;

  final String surname;

  final String username;

  final String emailAddress;

  get props => [firstname, surname, username, emailAddress];

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
