import 'package:flutter/material.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/widgets/app_show_dialog.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';

Future<T?> showFilterDialog<T>(
  BuildContext context, {
  required String? activeCategoryId,
  required ValueChanged<CategoryDTO> onChangeCategoryPressed,
  required List<CategoryDTO> categories,
}) =>
    showAppDialog<T>(
      context: context,
      title: 'Filter details',
      bottomWidgetBuilder: (context) {
        final updatedCategories = [allCategories, ...categories];

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Categories',
                    style: AppTextStyles.med16,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      for (final category in updatedCategories) ...[
                        FilterCategoryTile(
                          active: activeCategoryId == category.id,
                          categoryName: category.name,
                          onPressed: () => onChangeCategoryPressed(category),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

class FilterCategoryTile extends StatelessWidget {
  const FilterCategoryTile({
    Key? key,
    required this.categoryName,
    required this.onPressed,
    this.active = false,
  }) : super(key: key);

  final String categoryName;
  final VoidCallback onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      background: active ? AppColors.grey0 : AppColors.white,
      withBorderSide: true,
      onPressed: onPressed,
      child: Text(
        categoryName,
        style: AppTextStyles.reg12.copyWith(
          color: AppColors.black,
        ),
      ),
    );
  }
}
