import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreen extends HookWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTextEditingController = useTextEditingController();

    ProductsScreenState productsScreenState =
        context.watch<ProductsScreenCubit>().state;

    return Scaffold(
      body: productsScreenState.map(
        initial: (state) => const Center(
          child: CircularProgressIndicator(),
        ),
        loading: (state) => SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Products',
                withFilter: true,
                textEditingController: searchTextEditingController,
              ),
              Expanded(
                child: PagedListView<int, ProductDTO>(
                  padding: const EdgeInsets.only(bottom: 60),
                  pagingController: usePagingController<int, ProductDTO>(
                    firstPageKey: 0,
                    hasMore: state.totalCount > state.currentPage * pageSize,
                    items: state.products,
                    fetchPage: (int page) =>
                        context.read<ProductsScreenCubit>().fetch(page: page),
                    getNextPageKey: (_) => state.currentPage + 1,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<ProductDTO>(
                    itemBuilder: (context, item, index) {
                      return ProductTile(
                        productName:
                            state.products.elementAt(index).productInfo.name,
                        productPrice: state.products
                                .elementAt(index)
                                .productInfo
                                .price
                                .toString() +
                            '\$',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        ready: (state) => SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Products',
                withFilter: true,
                textEditingController: searchTextEditingController,
              ),
              Expanded(
                child: PagedListView<int, ProductDTO>(
                  padding: const EdgeInsets.only(bottom: 60),
                  pagingController: usePagingController<int, ProductDTO>(
                    firstPageKey: 0,
                    hasMore:
                        state.totalCount > (state.currentPage + 1) * pageSize,
                    items: state.products,
                    fetchPage: (int page) =>
                        context.read<ProductsScreenCubit>().fetch(page: page),
                    getNextPageKey: (_) => state.currentPage + 1,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<ProductDTO>(
                    itemBuilder: (context, item, index) {
                      return ProductTile(
                        productName:
                            state.products.elementAt(index).productInfo.name,
                        productPrice: state.products
                                .elementAt(index)
                                .productInfo
                                .price
                                .toString() +
                            '\$',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        error: (state) => const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}
