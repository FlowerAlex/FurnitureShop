import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/login_screen/login_screen.dart';
import 'package:furniture_shop/features/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

class AuthRouter extends HookWidget {
  const AuthRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorKey = useMemoized(GlobalKey<NavigatorState>.new);
    final authCubitState = context.watch<AuthCubit>().state;

    return WillPopScope(
      onWillPop: () async =>
          !(await navigatorKey.currentState?.maybePop() ?? false),
      child: Navigator(
        key: navigatorKey,
        pages: <Page<void>>[
          if (authCubitState is AuthLoggedInState) MainPage() else LoginPage()
        ],
        onPopPage: (route, dynamic result) => route.didPop(result),
      ),
    );
  }
}
