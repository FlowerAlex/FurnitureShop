// import 'package:bloc_test/bloc_test.dart';
// import 'package:cqrs/cqrs.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:furniture_shop/data/contracts.dart';

// import '../test_data.dart';

// class MockCQRS extends Mock implements CQRS {}

// void main() {
//   group(
//     'ProductsScreenCubit',
//     () {
//       late MockCQRS cqrs;

//       setUpAll(() {
//         registerFallbackValue(GetAllCategories());
//         registerFallbackValue(GetAllProducts(
//           sortByDescending: false,
//           pageSize: 10,
//           pageNumber: 0,
//         ));
//       });

//       setUp(() {
//         cqrs = MockCQRS();
//       });

//       ProductsScreenCubit buildCubit() => ProductsScreenCubit(
//             cqrs: cqrs,
//           );

//       blocTest<ProductsScreenCubit, ProductsScreenState>(
//         'emit initial ProductsScreenState on the start',
//         build: buildCubit,
//         verify: (cubit) => expect(cubit.state,
//             ProductsScreenInitialState(activeCategory: allCategories)),
//       );

//       blocTest<ProductsScreenCubit, ProductsScreenState>(
//         'run changeActiveCategory',
//         build: buildCubit,
//         act: (cubit) => cubit.changeActiveCategory(category1Test),
//         verify: (cubit) => expect(cubit.state,
//             ProductsScreenInitialState(activeCategory: category1Test)),
//       );

//       blocTest<ProductsScreenCubit, ProductsScreenState>(
//         'run fetch successfully',
//         build: () {
//           when(() => cqrs.get<List<CategoryDTO>>(
//               any(that: isA<GetAllCategories>()))).thenAnswer((_) async => []);
//           when(() => cqrs.get<PaginatedResult<ProductDTO>>(
//                   any(that: isA<GetAllProducts>())))
//               .thenAnswer(
//                   (_) async => PaginatedResult(items: [], totalCount: 0));
//           return buildCubit();
//         },
//         act: (cubit) => cubit.fetch(),
//         expect: () => [
//           ProductsScreenLoadingState(activeCategory: allCategories),
//           ProductsScreenReadyState(
//               products: [],
//               activeCategory: allCategories,
//               totalCount: 0,
//               currentPage: 0,
//               categories: []),
//         ],
//       );

//       blocTest<ProductsScreenCubit, ProductsScreenState>(
//         'run fetch unsuccessfully',
//         build: () {
//           when(() => cqrs.get<List<CategoryDTO>>(
//               any(that: isA<GetAllCategories>()))).thenThrow(Exception());

//           when(() => cqrs.get<PaginatedResult<ProductDTO>>(
//               any(that: isA<GetAllProducts>()))).thenThrow(Exception());

//           return buildCubit();
//         },
//         act: (cubit) => cubit.fetch(),
//         expect: () => [
//           ProductsScreenLoadingState(activeCategory: allCategories),
//           ProductsScreenErrorState(
//               products: [],
//               activeCategory: allCategories,
//               totalCount: 0,
//               currentPage: 0,
//               categories: []),
//         ],
//       );

//       blocTest<ProductsScreenCubit, ProductsScreenState>(
//         'run fetch for 2 pages successfully',
//         build: () {
//           when(() => cqrs.get<List<CategoryDTO>>(
//               any(that: isA<GetAllCategories>()))).thenAnswer((_) async => []);

//           when(() => cqrs.get<PaginatedResult<ProductDTO>>(
//                   any(that: isA<GetAllProducts>())))
//               .thenAnswer((_) async =>
//                   PaginatedResult(items: [productDTO1Test], totalCount: 2));

//           return buildCubit();
//         },
//         act: (cubit) async {
//           await cubit.fetch();
//           await cubit.fetch(page: 1);
//         },
//         expect: () => [
//           ProductsScreenLoadingState(activeCategory: allCategories),
//           ProductsScreenReadyState(
//             products: [productDTO1Test],
//             activeCategory: allCategories,
//             totalCount: 2,
//             currentPage: 0,
//             categories: [],
//           ),
//           ProductsScreenLoadingState(
//             activeCategory: allCategories,
//             products: [
//               productDTO1Test,
//             ],
//             totalCount: 2,
//           ),
//           ProductsScreenReadyState(
//             products: [productDTO1Test, productDTO1Test],
//             activeCategory: allCategories,
//             totalCount: 2,
//             currentPage: 1,
//             categories: [],
//           ),
//         ],
//       );
//     },
//   );
// }
