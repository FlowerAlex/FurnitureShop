import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.titleText,
    required this.child,
  }) : super(key: key);

  final String titleText;
  final Widget child;

  static Future<T?> show<T extends Object?>({
    required BuildContext context,
    required String titleText,
    required Widget child,
  }) =>
      showDialog<T>(
        context: context,
        builder: (context) => AppDialog(
          titleText: titleText,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 625),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleText,
                    style: Theme.of(context).dialogTheme.titleTextStyle,
                  ),
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Close'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Flexible(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
