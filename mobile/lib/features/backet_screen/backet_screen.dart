import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';

class BacketScreen extends HookWidget {
  const BacketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTextEditingController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            title: 'Backet',
            textEditingController: searchTextEditingController,
            withFilter: true,
          ),
        ],
      )),
    );
  }
}
