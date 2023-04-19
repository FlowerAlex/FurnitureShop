import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:furniture_shop/utils/spaced.dart';

const pageSize = 8;

class TableSection<T extends Object> extends StatelessWidget {
  const TableSection({
    Key? key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.totalCount,
    required this.currentPage,
    required this.onNextPressed,
    required this.onPrevPressed,
    this.createItemButtonLabel,
    this.createItemPressed,
  }) : super(key: key);

  final Widget title;

  final List<T> items;
  final Widget Function(T) itemBuilder;

  final int totalCount;
  final int currentPage;

  final VoidCallback onNextPressed;
  final VoidCallback onPrevPressed;

  final String? createItemButtonLabel;
  final VoidCallback? createItemPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title,
        Card(
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final item in items)
                        Builder(
                          key: Key(item.hashCode.toString()),
                          builder: (context) {
                            return itemBuilder(item);
                          },
                        ),
                    ].spacedWith(const Divider(height: 0)),
                  ),
                ),
              ),
              _TableNavigationBar(
                currentPage: currentPage,
                totalCount: totalCount,
                onPrevPressed: onPrevPressed,
                onNextPressed: onNextPressed,
                createItemButtonLabel: createItemButtonLabel,
                createItemPressed: createItemPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TableNavigationBar<T extends Object> extends StatelessWidget {
  const _TableNavigationBar({
    Key? key,
    required this.currentPage,
    required this.totalCount,
    required this.onPrevPressed,
    required this.onNextPressed,
    this.createItemButtonLabel,
    this.createItemPressed,
  })  : assert(
          (createItemButtonLabel == null && createItemPressed == null) ||
              createItemButtonLabel != null && createItemPressed != null,
        ),
        super(key: key);

  final int currentPage;
  final int totalCount;

  final VoidCallback onPrevPressed;
  final VoidCallback onNextPressed;

  final String? createItemButtonLabel;
  final VoidCallback? createItemPressed;

  @override
  Widget build(BuildContext context) {
    final createItemPressed = this.createItemPressed;
    final createItemButtonLabel = this.createItemButtonLabel;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          if (createItemPressed != null && createItemButtonLabel != null)
            TextButton(
              onPressed: createItemPressed,
              child: Text(
                createItemButtonLabel,
              ),
            ),
          const Spacer(),
          IconButton(
            onPressed: onPrevPressed,
            icon: Assets.icons.arrowLeft.svg(),
          ),
          const SizedBox(width: 16),
          Text(
            '${(currentPage * pageSize + 1).toString()}-${min((currentPage + 1) * pageSize, totalCount)} from ${totalCount.toString()}',
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onNextPressed,
            icon: Assets.icons.arrowRight.svg(),
          ),
        ],
      ),
    );
  }
}
