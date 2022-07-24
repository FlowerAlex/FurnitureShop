// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

AllModelsUrls _$AllModelsUrlsFromJson(Map<String, dynamic> json) =>
    AllModelsUrls();

Map<String, dynamic> _$AllModelsUrlsToJson(AllModelsUrls instance) =>
    <String, dynamic>{};

AllPhotosUrls _$AllPhotosUrlsFromJson(Map<String, dynamic> json) =>
    AllPhotosUrls();

Map<String, dynamic> _$AllPhotosUrlsToJson(AllPhotosUrls instance) =>
    <String, dynamic>{};

ModelUploadId _$ModelUploadIdFromJson(Map<String, dynamic> json) =>
    ModelUploadId();

Map<String, dynamic> _$ModelUploadIdToJson(ModelUploadId instance) =>
    <String, dynamic>{};

PhotoUploadId _$PhotoUploadIdFromJson(Map<String, dynamic> json) =>
    PhotoUploadId();

Map<String, dynamic> _$PhotoUploadIdToJson(PhotoUploadId instance) =>
    <String, dynamic>{};

CategoryById _$CategoryByIdFromJson(Map<String, dynamic> json) => CategoryById(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$CategoryByIdToJson(CategoryById instance) =>
    <String, dynamic>{
      'Id': instance.id,
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

AllComplaints _$AllComplaintsFromJson(Map<String, dynamic> json) =>
    AllComplaints(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
    );

Map<String, dynamic> _$AllComplaintsToJson(AllComplaints instance) =>
    <String, dynamic>{
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
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
      userId: json['UserId'] as String?,
      orderId: json['OrderId'] as String?,
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
      userId: json['UserId'] as String?,
      orderId: json['OrderId'] as String?,
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

AllOrders _$AllOrdersFromJson(Map<String, dynamic> json) => AllOrders(
      pageNumber: json['PageNumber'] as int,
      pageSize: json['PageSize'] as int,
      filterBy: (json['FilterBy'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$OrdersFilterFieldDTOEnumMap, k), e as String),
      ),
      sortBy: $enumDecodeNullable(_$OrdersSortFieldDTOEnumMap, json['SortBy']),
      sortByDescending: json['SortByDescending'] as bool,
    );

Map<String, dynamic> _$AllOrdersToJson(AllOrders instance) => <String, dynamic>{
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
      products: (json['Products'] as List<dynamic>)
          .map((e) => ProductInOrderDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String,
    );

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
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
      'Products': instance.products,
      'Id': instance.id,
    };

OrderDTOBase _$OrderDTOBaseFromJson(Map<String, dynamic> json) => OrderDTOBase(
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
      products: (json['Products'] as List<dynamic>)
          .map((e) => ProductInOrderDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDTOBaseToJson(OrderDTOBase instance) =>
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
      'Products': instance.products,
    };

ProductInOrderDTO _$ProductInOrderDTOFromJson(Map<String, dynamic> json) =>
    ProductInOrderDTO(
      product: ProductDTO.fromJson(json['Product'] as Map<String, dynamic>),
      amount: json['Amount'] as int,
    );

Map<String, dynamic> _$ProductInOrderDTOToJson(ProductInOrderDTO instance) =>
    <String, dynamic>{
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

const _$ProductsSortFieldDTOEnumMap = {
  ProductsSortFieldDTO.name: 0,
  ProductsSortFieldDTO.rating: 1,
  ProductsSortFieldDTO.price: 2,
};

CreateProduct _$CreateProductFromJson(Map<String, dynamic> json) =>
    CreateProduct(
      newProduct: ProducDetailsDTOBase.fromJson(
          json['NewProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductToJson(CreateProduct instance) =>
    <String, dynamic>{
      'NewProduct': instance.newProduct,
    };

DeleteProduct _$DeleteProductFromJson(Map<String, dynamic> json) =>
    DeleteProduct(
      id: json['Id'] as String,
    );

Map<String, dynamic> _$DeleteProductToJson(DeleteProduct instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

ProducDetailsDTOBase _$ProducDetailsDTOBaseFromJson(
        Map<String, dynamic> json) =>
    ProducDetailsDTOBase(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoURL: json['PreviewPhotoURL'] as String?,
      categoryId: json['CategoryId'] as String?,
      description: json['Description'] as String,
      modelUrl: json['ModelUrl'] as String?,
    );

Map<String, dynamic> _$ProducDetailsDTOBaseToJson(
        ProducDetailsDTOBase instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'AverageRating': instance.averageRating,
      'PreviewPhotoURL': instance.previewPhotoURL,
      'CategoryId': instance.categoryId,
      'Description': instance.description,
      'ModelUrl': instance.modelUrl,
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
      categoryId: json['CategoryId'] as String?,
      description: json['Description'] as String,
      modelUrl: json['ModelUrl'] as String?,
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ProductDetailsDTOToJson(ProductDetailsDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'AverageRating': instance.averageRating,
      'PreviewPhotoURL': instance.previewPhotoURL,
      'CategoryId': instance.categoryId,
      'Description': instance.description,
      'ModelUrl': instance.modelUrl,
      'Id': instance.id,
    };

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoURL: json['PreviewPhotoURL'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String,
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'AverageRating': instance.averageRating,
      'PreviewPhotoURL': instance.previewPhotoURL,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
    };

ProductDTOBase _$ProductDTOBaseFromJson(Map<String, dynamic> json) =>
    ProductDTOBase(
      name: json['Name'] as String,
      price: (json['Price'] as num).toDouble(),
      averageRating: (json['AverageRating'] as num?)?.toDouble(),
      previewPhotoURL: json['PreviewPhotoURL'] as String?,
      categoryId: json['CategoryId'] as String?,
    );

Map<String, dynamic> _$ProductDTOBaseToJson(ProductDTOBase instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'AverageRating': instance.averageRating,
      'PreviewPhotoURL': instance.previewPhotoURL,
      'CategoryId': instance.categoryId,
    };

UpdateProduct _$UpdateProductFromJson(Map<String, dynamic> json) =>
    UpdateProduct(
      updatedProduct: ProductDetailsDTO.fromJson(
          json['UpdatedProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProductToJson(UpdateProduct instance) =>
    <String, dynamic>{
      'UpdatedProduct': instance.updatedProduct,
    };
