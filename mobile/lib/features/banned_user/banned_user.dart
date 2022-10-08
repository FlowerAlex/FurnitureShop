import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class BannedUserPage extends MaterialPage<void> {
  const BannedUserPage() : super(child: const BannedUserScreen());
}

class BannedUserScreen extends StatelessWidget {
  const BannedUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.blockedUser.svg(
            width: 80,
            height: 80,
          ),
          const Text(
            'This account has beed banned, please contact administrator for more details',
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async => context.read<AuthCubit>().logOut(),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
