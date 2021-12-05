import 'package:flutter/material.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.grey0.withAlpha(122),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey0.withAlpha(122),
              blurRadius: 1,
              offset: Offset(0, 3),
            )
          ]),
      child: InkWell(
        onTap: Navigator.of(context).pop,
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: AssetIcon(
            asset: Assets.icons.backArrow,
            color: AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}
