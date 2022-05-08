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

    final cubit = context.watch<ProductsScreenCubit>();

    return Scaffold(
      body: cubit.state.map(
        ready: (state) => SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Products',
                withFilter: true,
                textEditingController: searchTextEditingController,
                categories: state.categories,
                activeCategoryId: state.activeCategory?.id,
              ),
              Expanded(
                child: PagedListView<int, ProductDTO>(
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
                        productLikeClicked: () => cubit.likeProduct(item.id),
                        productShoppingCartClicked: () =>
                            cubit.addProductToShoppingCart(item.id),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        error: (state) => Center(
          child: Text('Something went wrong\nError: ${state.errorMessage}'),
        ),
      ),
    );
  }
}
