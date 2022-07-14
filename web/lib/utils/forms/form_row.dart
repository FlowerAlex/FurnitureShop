import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/spaced.dart';

class FormRow extends StatelessWidget {
  FormRow({
    Key? key,
    this.indent = 16,
    this.defaultFlex = 1,
    this.childrenFlex = const <int, int>{},
    this.totalFlex = 10,
    required this.children,
  })  : assert(childrenFlex.values.reduce((a, b) => a + b) <= totalFlex),
        super(key: key);

  final double indent;

  final int defaultFlex;
  final Map<int, int> childrenFlex;
  final int totalFlex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final flexLeft = totalFlex - childrenFlex.values.reduce((a, b) => a + b);

    return Row(
      children: [
        for (var i = 0; i < children.length; i++)
          Expanded(
            flex: childrenFlex[i] ?? defaultFlex,
            child: children[i],
          ),
        if (flexLeft != 0)
          Spacer(
            flex: flexLeft,
          ),
      ].spaced(indent),
    );
  }
}
