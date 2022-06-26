import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello World!'),
            OutlinedButton(
              onPressed: () async {
                await authCubit.logOut();
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends MaterialPage<void> {
  const MainPage()
      : super(
          child: const MainScreen(),
        );
}
