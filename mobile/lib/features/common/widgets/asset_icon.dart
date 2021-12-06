import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/app_colors.dart';

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
  final AssetImage asset;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      asset,
      color: color ?? (active ? AppColors.white : AppColors.labelText),
      size: size,
    );
  }
}
