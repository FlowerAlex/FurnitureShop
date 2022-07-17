import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/categories_screen/categories_screen_cubit.dart';
import 'package:furniture_shop/features/categories_screen/categories_table_section.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoriesScreenCubit(
          cqrs: context.read(),
        )..init(),
        child: BlocBuilder<CategoriesScreenCubit, CategoriesScreenState>(
          builder: (context, state) => state.map(
            ready: (state) => _CategoriesScreenBody(state: state),
            error: (state) => Center(
              child: Text('Error: ${state.error}'),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoriesScreenBody extends StatelessWidget {
  const _CategoriesScreenBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CategoriesScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesTableSection(state: state),
      ],
    );
  }
}
