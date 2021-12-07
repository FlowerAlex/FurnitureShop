import 'package:flutter/material.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

Future<T?> showUpdateProfileDialog<T>({
  required BuildContext context,
  required String title,
  required Widget child,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 32),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  shape: const CircleBorder(),
                  child: InkResponse(
                    radius: 16,
                    onTap: Navigator.of(context).pop,
                    child: AssetIcon(
                      asset: Assets.icons.cross,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: AppTextStyles.med16.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 20),
              child,
            ],
          ),
        ),
      ),
    );
