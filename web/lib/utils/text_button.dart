import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onPressed,
      style: selected
          ? theme.textButtonTheme.style?.copyWith(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.grey3.withAlpha(122)),
            )
          : null,
      child: Align(child: Text(text)),
    );
  }
}
