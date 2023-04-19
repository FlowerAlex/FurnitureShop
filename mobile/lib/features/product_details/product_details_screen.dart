import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:furniture_shop/features/product_details/product_details_screen_cubit.dart';
import 'package:furniture_shop/features/product_details/reviews_section/reviews_section.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductDetailsScreenRoute extends MaterialPageRoute<void> {
  ProductDetailsScreenRoute({
    required String productId,
  }) : super(
          builder: (context) => BlocProvider(
            create: (context) => ProductDetailsScreenCubit(
              productId: productId,
              cqrs: context.read(),
            )..init(),
            child: const ProductDetailsScreen(),
          ),
        );
}

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsScreenCubit, ProductDetailsScreenState>(
        builder: (context, state) => state.map(
          error: (state) => Center(
            child: Text(state.errorMessage),
          ),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          ready: (state) {
            final theme = Theme.of(context);
            final cubit = context.read<ProductDetailsScreenCubit>();

            final productDetails = state.productDetails;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text(
                          productDetails.name,
                          style: theme.textTheme.headline5,
                        ),
                      ),
                      if (productDetails.modelId != null)
                        Align(
                          child: SizedBox(
                            width: 300,
                            height: 300,
                            child: ModelViewer(
                              src:
                                  'https://furniturestorage.blob.core.windows.net/models/${productDetails.modelId}',
                            ),
                          ),
                        ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final photoId in productDetails.photoIds)
                              CachedNetworkImage(
                                imageUrl:
                                    'https://furniturestorage.blob.core.windows.net/images/$photoId',
                              ),
                            const SizedBox(width: 16),
                          ]..removeLast(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AvaregeScore(
                            rating: productDetails.averageRating ?? 0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: cubit.likeProduct,
                                child: productDetails.inFavourites
                                    ? Assets.icons.selectedHeart.image()
                                    : Assets.icons.heart.image(),
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: cubit.addProductToShoppingCart,
                                child: productDetails.inShoppingCart
                                    ? Assets.icons.selectedAddToCart.image()
                                    : Assets.icons.addToCart.image(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Price: ${productDetails.price}\$',
                      ),
                      Text(
                        'Description: ${productDetails.description}',
                      ),
                      ReviewsSection(
                        myReviewData: state.myReviewData,
                        reviews: state.reviews,
                        totalCount: state.totalCount,
                        currentPage: state.currentPage,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
