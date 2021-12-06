import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.withBorderSide = false,
    this.background = AppColors.grey0,
  }) : super(key: key);

  final Widget child;
  final Color background;
  final VoidCallback onPressed;
  final bool withBorderSide;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.grey0),
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
              side: withBorderSide
                  ? const BorderSide(
                      color: AppColors.grey5,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
