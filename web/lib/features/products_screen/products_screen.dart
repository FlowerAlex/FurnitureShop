import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/utils/text_button.dart';
import 'package:furniture_shop/utils/use_paging_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsScreenCubit(
        cqrs: context.read(),
      )..fetch(),
      child: BlocBuilder<ProductsScreenCubit, ProductsScreenState>(
        builder: (context, state) {
          return state.map(
            ready: (state) => ProductsScreenBody(state: state),
            error: (state) => Center(
              child: Text('Error: ${state.error}'),
            ),
          );
        },
      ),
    );
  }
}

class ProductsScreenBody extends HookWidget {
  const ProductsScreenBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProductsScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsScreenCubit>();

    final currentFile = state.currentFile;

    return Column(
      children: [
        SizedBox(
          height: 400,
          child: PagedListView<int, ProductDTO>(
            pagingController: usePagingController<int, ProductDTO>(
              firstPageKey: 0,
              hasMore: state.totalCount > (state.currentPage + 1) * pageSize,
              items: state.products,
              fetchPage: (int page) => cubit.fetch(page: page),
              getNextPageKey: (_) => state.currentPage + 1,
            ),
            builderDelegate: PagedChildBuilderDelegate<ProductDTO>(
              itemBuilder: (context, product, index) {
                return ProductTile(
                  product: product,
                  children: const [],
                );
              },
              firstPageProgressIndicatorBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        AppTextButton(
          text: 'Pick file',
          onPressed: cubit.pickFile,
        ),
        if (currentFile != null) ...[
          const SizedBox(height: 16),
          Text(currentFile.name),
        ],
        const SizedBox(height: 16),
        AppTextButton(
          text: 'Upload file',
          onPressed: cubit.uploadFile,
        ),
      ],
    );
  }
}
