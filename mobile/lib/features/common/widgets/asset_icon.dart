import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon({
    required this.asset,
    this.size,
    this.color,
    this.active = false,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final double? size;
  final AssetGenImage asset;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return asset.image(
      color: color ?? (active ? AppColors.white : AppColors.labelText),
      width: size,
      height: size,
    );
  }
}
