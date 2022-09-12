import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/favorites_screen/favorites_screen.dart';
import 'package:furniture_shop/features/favorites_screen/favorites_screen_cubit.dart';
import 'package:furniture_shop/features/main_screen/bottom_bar.dart';
import 'package:furniture_shop/features/main_screen/main_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/products_screen.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen_cubit.dart';
import 'package:furniture_shop/features/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:furniture_shop/features/shopping_cart_screen/shopping_cart_screen_cubit.dart';

class MainScreen extends HookWidget {
  MainScreen({Key? key}) : super(key: key);

  final screens = [
    const ProductsScreen(),
    const FavoritesScreen(),
    const ShoppingCartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      fetchAll(context);
      return null;
    });

    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit, Screen>(
        listener: _mainScreenCubitListener,
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.index,
              children: screens,
            ),
            bottomNavigationBar: const BottomBar(),
          );
        },
      ),
    );
  }

  void _mainScreenCubitListener(BuildContext context, Screen state) {
    switch (state) {
      case Screen.products:
        context.read<ProductsScreenCubit>().init();
        break;
      case Screen.profile:
        context.read<ProfileScreenCubit>().fetch();
        break;
      case Screen.shoppingCart:
        context.read<ShoppingCartScreenCubit>().fetch();
        break;
      case Screen.favorites:
        context.read<FavouritesScreenCubit>().fetch();
        break;
      default:
        break;
    }
  }

  Future<void> fetchAll(BuildContext context) async {
    await Future.wait([
      context.read<ProductsScreenCubit>().init(),
      context.read<ProfileScreenCubit>().fetch(),
      context.read<ShoppingCartScreenCubit>().fetch(),
    ]);
  }
}

class MainPage extends MaterialPage<void> {
  MainPage()
      : super(
          child: MainScreen(),
        );
}
