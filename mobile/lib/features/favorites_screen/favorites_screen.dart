import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:furniture_shop/features/favorites_screen/favorites_screen_cubit.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FavoritesScreen extends HookWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FavouritesScreenCubit>();

    return Scaffold(
      body: cubit.state.map(
        ready: (state) => SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Favorites',
                withFilter: true,
                categories: state.categories,
                onChangeCategoryPressed: cubit.changeActiveCategory,
                activeCategoryId: state.activeCategory?.id,
              ),
              Expanded(
                child: PagedListView<int, ProductDTO>(
                  pagingController: usePagingController<int, ProductDTO>(
                    firstPageKey: 0,
                    hasMore:
                        state.totalCount > (state.currentPage + 1) * pageSize,
                    items: state.products,
                    fetchPage: (page) => cubit.fetch(page: page),
                    getNextPageKey: (_) => state.currentPage + 1,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<ProductDTO>(
                    itemBuilder: (context, product, index) {
                      return ProductTile(
                        product: product,
                        children: [
                          InkWell(
                            onTap: () =>
                                cubit.removeProductFromFavourites(product.id),
                            child: Assets.icons.selectedHeart.image(),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () =>
                                cubit.addProductToShoppingCart(product.id),
                            child: product.inShoppingCart
                                ? Assets.icons.selectedAddToCart.image()
                                : Assets.icons.addToCart.image(),
                          ),
                        ],
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (state) => Center(
          child: Text('Something went wrong\nError: ${state.error}'),
        ),
      ),
    );
  }
}
