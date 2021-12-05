import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon({
    required this.asset,
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final double? size;
  final AssetImage asset;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      asset,
      color: color,
      size: size,
    );
  }
}
