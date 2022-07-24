import 'package:bloc_test/bloc_test.dart';
import 'package:cqrs/cqrs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../test_data.dart';

class MockCQRS extends Mock implements CQRS {}

void main() {
  group(
    'ProductsScreenCubit',
    () {
      late MockCQRS cqrs;

      setUpAll(() {
        registerFallbackValue(AllCategories());
        registerFallbackValue(AllProducts(
          sortByDescending: false,
          pageSize: 10,
          pageNumber: 0,
        ));
      });

      setUp(() {
        cqrs = MockCQRS();
      });

      ProductsScreenCubit buildCubit() => ProductsScreenCubit(
            cqrs: cqrs,
          );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'emit initial ProductsScreenState on the start',
        build: buildCubit,
        verify: (cubit) => expect(
            cubit.state, const ProductsScreenReadyState(activeCategory: null)),
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run changeActiveCategory',
        build: buildCubit,
        act: (cubit) => cubit.changeActiveCategory(category1Test),
        verify: (cubit) => expect(cubit.state,
            ProductsScreenReadyState(activeCategory: category1Test)),
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run fetch successfully',
        build: () {
          when(() =>
                  cqrs.get<List<CategoryDTO>>(any(that: isA<AllCategories>())))
              .thenAnswer((_) async => []);
          when(() => cqrs.get<PaginatedResult<ProductDTO>>(
                  any(that: isA<AllProducts>())))
              .thenAnswer(
                  (_) async => PaginatedResult(items: [], totalCount: 0));
          return buildCubit();
        },
        act: (cubit) => cubit.fetch(),
        expect: () => [
          const ProductsScreenReadyState(activeCategory: null, isLoading: true),
          ProductsScreenReadyState(
              products: [],
              activeCategory: allCategories,
              totalCount: 0,
              currentPage: 0,
              categories: []),
        ],
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run fetch unsuccessfully',
        build: () {
          when(() =>
                  cqrs.get<List<CategoryDTO>>(any(that: isA<AllCategories>())))
              .thenThrow(Exception(''));

          when(() => cqrs.get<PaginatedResult<ProductDTO>>(
              any(that: isA<AllProducts>()))).thenThrow(Exception(''));

          return buildCubit();
        },
        act: (cubit) => cubit.fetch(),
        expect: () => [
          const ProductsScreenReadyState(activeCategory: null, isLoading: true),
          const ProductsScreenErrorState(errorMessage: 'Exception: '),
        ],
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run fetch for 2 pages successfully',
        build: () {
          when(() =>
                  cqrs.get<List<CategoryDTO>>(any(that: isA<AllCategories>())))
              .thenAnswer((_) async => []);

          when(() => cqrs.get<PaginatedResult<ProductDTO>>(
                  any(that: isA<AllProducts>())))
              .thenAnswer((_) async =>
                  PaginatedResult(items: [productDTO1Test], totalCount: 2));

          return buildCubit();
        },
        act: (cubit) async {
          await cubit.fetch();
          await cubit.fetch(page: 1);
        },
        expect: () => [
          const ProductsScreenReadyState(activeCategory: null, isLoading: true),
          ProductsScreenReadyState(
            products: [productDTO1Test],
            activeCategory: allCategories,
            totalCount: 2,
            currentPage: 0,
            categories: [],
          ),
          ProductsScreenReadyState(
            isLoading: true,
            activeCategory: allCategories,
            products: [
              productDTO1Test,
            ],
            totalCount: 2,
          ),
          ProductsScreenReadyState(
            products: [productDTO1Test, productDTO1Test],
            activeCategory: allCategories,
            totalCount: 2,
            currentPage: 1,
            categories: [],
          ),
        ],
      );
    },
  );
}
