import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/orders_screen/orders_screen_cubit.dart';
import 'package:furniture_shop/features/orders_screen/sections/orders_table_section.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersScreenCubit(
        cqrs: context.read(),
      )..fetch(),
      child: BlocBuilder<OrdersScreenCubit, OrdersScreenState>(
        builder: (context, state) {
          return state.map(
            ready: (state) => _OrdersScreenBody(state: state),
            error: (state) => Center(
              child: Text('Error: ${state.error}'),
            ),
          );
        },
      ),
    );
  }
}

class _OrdersScreenBody extends HookWidget {
  const _OrdersScreenBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final OrdersScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          OrdersTableSection(
            state: state,
          ),
        ],
      ),
    );
  }
}
