import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';

class AppTextFormField extends HookWidget {
  const AppTextFormField({
    Key? key,
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
    this.validator,
  }) : super(key: key);

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
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final errorText = useState('');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 4),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    label!,
                    style: AppTextStyles.reg12
                        .copyWith(color: AppColors.primaryText),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.primaryText,
            obscureText: obscureText,
            readOnly: readOnly,
            style: AppTextStyles.reg14.copyWith(color: AppColors.primaryText),
            autocorrect: autocorrect,
            textAlignVertical: TextAlignVertical.center,
            autofillHints: autofillHints,
            keyboardType: keyboardType,
            validator: (value) {
              final validatorText = (validator?.call(value));
              errorText.value = validatorText ?? '';
              return (validatorText != null ? '' : null);
            },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: prefix,
              ),
              contentPadding: const EdgeInsets.only(left: 16),
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: AppColors.errorRed,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: AppColors.errorRed,
                ),
              ),
              errorStyle: const TextStyle(
                height: 0,
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
        if (errorText.value != '')
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    errorText.value,
                    style:
                        AppTextStyles.reg12.copyWith(color: AppColors.errorRed),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
