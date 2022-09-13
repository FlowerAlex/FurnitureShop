import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/dialogs/app_dialog.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    required this.titleText,
    this.description,
  }) : super(key: key);

  final String titleText;
  final String? description;

  static Future<bool?> show({
    required BuildContext context,
    required String titleText,
    String? description,
  }) =>
      showDialog<bool>(
        context: context,
        builder: (context) => ConfirmDialog(
          titleText: titleText,
          description: description,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final description = this.description;

    return AppDialog(
      titleText: titleText,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null) ...[
              Text(
                description,
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
