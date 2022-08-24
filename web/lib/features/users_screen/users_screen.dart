import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/users_screen/sections/users_table_section.dart';
import 'package:furniture_shop/features/users_screen/users_screen_cubit.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersScreenCubit(
        cqrs: context.read(),
      )..fetch(),
      child: BlocBuilder<UsersScreenCubit, UsersScreenState>(
        builder: (context, state) {
          return state.map(
            ready: (state) => _UsersScreenBody(state: state),
            error: (state) => Center(
              child: Text('Error: ${state.error}'),
            ),
          );
        },
      ),
    );
  }
}

class _UsersScreenBody extends HookWidget {
  const _UsersScreenBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UsersScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          UsersTableSection(
            state: state,
          ),
        ],
      ),
    );
  }
}
