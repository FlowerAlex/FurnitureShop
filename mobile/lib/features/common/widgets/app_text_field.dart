import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.initialValue,
    this.controller,
    this.prefix,
    this.suffixIcon,
    this.hintText,
    this.label,
    this.backgroundColor,
    this.autocorrect = true,
    this.obscureText = false,
    this.readOnly = false,
    this.autofillHints,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  final String? initialValue;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffixIcon;
  final String? hintText;
  final String? label;
  final bool obscureText;
  final Color? backgroundColor;
  final bool readOnly;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

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
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            initialValue: initialValue,
            controller: controller,
            onChanged: onChanged,
            cursorColor: AppColors.primaryText,
            obscureText: obscureText,
            readOnly: readOnly,
            style: AppTextStyles.reg14.copyWith(color: AppColors.primaryText),
            autocorrect: autocorrect,
            textAlignVertical: TextAlignVertical.center,
            autofillHints: autofillHints,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: prefix,
              ),
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
              hintStyle:
                  AppTextStyles.reg14.copyWith(color: AppColors.primaryText),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: AppColors.grey5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                  color: readOnly ? AppColors.grey5 : AppColors.black,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: AppColors.grey5,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(),
              prefix: prefix != null
                  ? null
                  : const SizedBox(
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
