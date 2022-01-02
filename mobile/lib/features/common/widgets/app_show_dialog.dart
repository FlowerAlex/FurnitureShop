import 'package:flutter/material.dart';
import 'package:furniture_shop/features/common/widgets/circle_button.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required String title,
  WidgetBuilder? bottomWidgetBuilder,
  bool showCloseButton = true,
  bool useRootNavigator = true,
}) =>
    showDialog<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (context) => ExplanationDialog(
        title: title,
        bottomWidgetBuilder: bottomWidgetBuilder,
        showCloseButton: showCloseButton,
      ),
    );

class ExplanationDialog extends StatelessWidget {
  const ExplanationDialog({
    Key? key,
    required this.title,
    this.bottomWidgetBuilder,
    this.showCloseButton = true,
  }) : super(key: key);

  final String title;
  final WidgetBuilder? bottomWidgetBuilder;
  final bool showCloseButton;

  @override
  Widget build(BuildContext context) {
    final bottomWidgetBuilder = this.bottomWidgetBuilder;

    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCloseButton)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                  ),
                  child: CircleButton(
                    asset: Assets.icons.cross,
                    onPressed: Navigator.of(context).pop,
                  ),
                ),
              )
            else
              const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.med18,
              ),
            ),
            if (bottomWidgetBuilder != null) ...[
              const SizedBox(height: 32),
              bottomWidgetBuilder(context),
              const SizedBox(height: 24),
            ] else
              const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
