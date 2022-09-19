import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/categories_screen/categories_screen_cubit.dart';
import 'package:furniture_shop/features/categories_screen/category_form_body/category_form_body.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:furniture_shop/utils/dialogs/app_dialog.dart';
import 'package:furniture_shop/utils/table_section.dart';

class CategoriesTableSection extends StatelessWidget {
  const CategoriesTableSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CategoriesScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesScreenCubit>();

    return TableSection<CategoryDTO>(
      title: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('Categories list'),
      ),
      items: state.currentPageCategories,
      currentPage: state.currentPage,
      totalCount: state.totalCount,
      onPrevPressed: () => cubit.changePage(page: state.currentPage - 1),
      onNextPressed: () => cubit.changePage(page: state.currentPage + 1),
      createItemButtonLabel: 'Create new category',
      createItemPressed: () {
        AppDialog.show<CategoryDTO>(
          context: context,
          titleText: 'Create category form',
          child: CategoryFormBody(
            onConfirmPressed: cubit.init,
            confirmText: 'Create category',
          ),
        );
      },
      itemBuilder: (category) => _CategoryItem(
        category: category,
        onPressed: () {
          AppDialog.show<CategoryDTO>(
            context: context,
            titleText: 'Update category form',
            child: CategoryFormBody(
              onConfirmPressed: cubit.init,
              confirmText: 'Update category',
              categoryId: category.id,
              initialValue: category.name,
            ),
          );
        },
        onDeletePressed: () async {
          await cubit.deleteCategory(category.id);
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key,
    required this.category,
    required this.onDeletePressed,
    this.onPressed,
  }) : super(key: key);

  final CategoryDTO category;
  final VoidCallback? onPressed;
  final VoidCallback onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category.name),
              IconButton(
                onPressed: onDeletePressed,
                icon: Assets.icons.trash.svg(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
