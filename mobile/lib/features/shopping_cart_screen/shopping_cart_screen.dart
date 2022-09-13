import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:furniture_shop/features/shopping_cart_screen/shopping_cart_screen_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ShoppingCartScreenCubit>();
    final state = cubit.state;
    final isReadyState = state is ShoppingCartScreenStateReady;

    final selectedProductsCount = isReadyState
        ? state.shoppingCartProducts
            .where((element) => element.selected)
            .map((e) => e.product.amount)
            .sum
        : null;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: 'Shopping cart',
                  withFilter: true,
                  categories: state is ShoppingCartScreenStateReady
                      ? state.categories
                      : [],
                  activeCategoryId: state is ShoppingCartScreenStateReady
                      ? state.activeCategory?.id
                      : null,
                  onChangeCategoryPressed: cubit.changeActiveCategory,
                ),
                Expanded(
                  child: state.map(
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    ready: (state) => _ShoppingCartReadyBody(state: state),
                    error: (state) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(state.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (selectedProductsCount != null && selectedProductsCount > 0)
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Opacity(
                    opacity: 0.8,
                    child: AppTextButton(
                      onPressed: cubit.buySelectedProducts,
                      child: Text(
                        'Buy products ($selectedProductsCount)',
                        style: AppTextStyles.reg16.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
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
      fetchPage: (page) => cubit.fetch(page: page),
      getNextPageKey: (_) => state.currentPage + 1,
    );

    return PagedListView<int, ShoppingCartProductDTO>(
      pagingController: paginatingController,
      builderDelegate: PagedChildBuilderDelegate<ShoppingCartProductDTO>(
        itemBuilder: (context, item, index) {
          final shoppingCartProduct =
              state.shoppingCartProducts.elementAt(index);
          final product = shoppingCartProduct.product;

          return ProductTile(
            selectable: true,
            selected: shoppingCartProduct.selected,
            countOfProducts: shoppingCartProduct.product.amount,
            onCountOfProductsChanged: (value) => cubit.changeCountOfProducts(
              productId: product.product.id,
              count: value,
            ),
            onSelectedChanged: (selected) => cubit.selectProduct(
              productId: product.product.id,
              selected: selected,
            ),
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
