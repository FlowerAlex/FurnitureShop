import 'package:flutter/material.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.asset,
  }) : super(key: key);

  final VoidCallback onPressed;
  final AssetImage asset;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkResponse(
        radius: 16,
        onTap: onPressed,
        child: AssetIcon(
          asset: asset,
          size: 32,
        ),
      ),
    );
  }
}
