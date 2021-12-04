import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.label,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? hintText;
  final String? label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 4),
            child: Text(
              label!,
              style: AppTextStyles.reg12.copyWith(color: AppColors.primaryText),
            ),
          ),
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            cursorColor: AppColors.primaryText,
            obscureText: obscureText,
            style: AppTextStyles.reg14,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: AppColors.grey5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: AppColors.black,
                ),
              ),
              prefix: const SizedBox(
                width: 10,
              ),
              suffixIcon: suffixIcon,
              focusColor: AppColors.grey1,
            ),
          ),
        ),
      ],
    );
  }
}
