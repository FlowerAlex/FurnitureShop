import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class AssetButton extends StatelessWidget {
  const AssetButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.color,
    this.splashRadius = 16,
  }) : super(key: key);

  final AssetGenImage icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double splashRadius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: splashRadius,
      onPressed: onPressed,
      icon: icon.image(
        color: color,
      ),
    );
  }
}
