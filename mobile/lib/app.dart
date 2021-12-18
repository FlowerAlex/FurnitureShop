import 'package:flutter/material.dart';
import 'package:furniture_shop/features/auth/auth_router.dart';
import 'package:furniture_shop/resources/app_theme.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture Shop',
      theme: appTheme,
      home: const KeyboardDismisser(child: AuthRouter()),
    );
  }
}

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
