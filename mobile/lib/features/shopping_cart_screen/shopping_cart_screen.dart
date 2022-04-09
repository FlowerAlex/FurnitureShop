import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/features/shopping_cart_screen/shopping_cart_screen_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShoppingCartScreen extends HookWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTextEditingController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            title: 'Shopping cart',
            textEditingController: searchTextEditingController,
            withFilter: true,
          ),
          Expanded(
            child:
                BlocBuilder<ShoppingCartScreenCubit, ShoppingCartScreenState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  ready: (state) => PagedListView<int, ShoppingCartProductDTO>(
                    padding: const EdgeInsets.only(bottom: 60),
                    pagingController:
                        usePagingController<int, ShoppingCartProductDTO>(
                      firstPageKey: 0,
                      hasMore: state.totalCount > state.currentPage * pageSize,
                      items: state
                          .shoppingCart.shoppingCartInfo.shoppingCartProducts,
                      fetchPage: (int page) => context
                          .read<ShoppingCartScreenCubit>()
                          .fetch(page: page),
                      getNextPageKey: (_) => state.currentPage + 1,
                    ),
                    builderDelegate:
                        PagedChildBuilderDelegate<ShoppingCartProductDTO>(
                      itemBuilder: (context, item, index) {
                        final product = state
                            .shoppingCart.shoppingCartInfo.shoppingCartProducts
                            .elementAt(index)
                            .product;
                        return ProductTile(
                          productName: product.productInfo.name,
                          productPrice:
                              product.productInfo.price.toString() + '\$',
                        );
                      },
                    ),
                  ),
                  error: (state) => Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(state.error)),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
