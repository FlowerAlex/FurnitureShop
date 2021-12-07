import 'package:flutter/material.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';

class AssetButton extends StatelessWidget {
  const AssetButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.splashRadius = 16,
  }) : super(key: key);

  final AssetIcon icon;
  final VoidCallback? onPressed;
  final double splashRadius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: splashRadius,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
