import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:furniture_shop/features/shopping_cart_screen/shopping_cart_screen_cubit.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ShoppingCartScreenCubit>().state;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            title: 'Shopping cart',
            withFilter: true,
            categories:
                state is ShoppingCartScreenStateReady ? state.categories : [],
            activeCategoryId: state is ShoppingCartScreenStateReady
                ? state.activeCategory.id
                : null,
            onChangeCategoryPressed:
                context.read<ShoppingCartScreenCubit>().changeActiveCategory,
          ),
          Expanded(
            child:
                BlocBuilder<ShoppingCartScreenCubit, ShoppingCartScreenState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  ready: (state) => _ShoppingCartReadyBody(state: state),
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

class _ShoppingCartReadyBody extends HookWidget {
  const _ShoppingCartReadyBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ShoppingCartScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShoppingCartScreenCubit>();

    final paginatingController =
        usePagingController<int, ShoppingCartProductDTO>(
      firstPageKey: 0,
      hasMore: state.totalCount > state.currentPage * pageSize,
      items: state.shoppingCartProducts.map((e) => e.product).toList(),
      fetchPage: (int page) => cubit.fetch(page: page),
      getNextPageKey: (_) => state.currentPage + 1,
    );

    return PagedListView<int, ShoppingCartProductDTO>(
      padding: const EdgeInsets.only(bottom: 60),
      pagingController: paginatingController,
      builderDelegate: PagedChildBuilderDelegate<ShoppingCartProductDTO>(
        itemBuilder: (context, item, index) {
          final shoppingCartProduct =
              state.shoppingCartProducts.elementAt(index);
          final product = shoppingCartProduct.product;

          return ProductTile(
            selectable: true,
            selected: false, // TODO:
            onSelectedChanged: (selected) {}, // TODO:
            product: product.product,
            children: [
              InkWell(
                onTap: () =>
                    cubit.removeProductFromShoppingCart(product.product.id),
                child: Assets.icons.selectedAddToCart.image(),
              ),
            ],
          );
        },
        firstPageProgressIndicatorBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
