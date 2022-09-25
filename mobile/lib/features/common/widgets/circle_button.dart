import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.asset,
  }) : super(key: key);

  final VoidCallback onPressed;
  final AssetGenImage asset;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkResponse(
        radius: 16,
        onTap: onPressed,
        child: asset.image(width: 32, height: 32),
      ),
    );
  }
}
