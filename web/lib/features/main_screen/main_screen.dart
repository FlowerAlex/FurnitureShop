import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/main_screen/main_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/products_screen.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/text_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  String _getNameForSection(MainScreenSection section) {
    switch (section) {
      case MainScreenSection.products:
        return 'Products';
      case MainScreenSection.categories:
        return 'Categories';
      case MainScreenSection.users:
        return 'Users';
      case MainScreenSection.orders:
        return 'Orders';
    }
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final mainScreenCubit = context.watch<MainScreenCubit>();

    return Scaffold(
        body: Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (final section in MainScreenSection.values)
                      AppTextButton(
                        text: _getNameForSection(section),
                        selected: section.index ==
                            mainScreenCubit.state.currentSection.index,
                        onPressed: () =>
                            mainScreenCubit.changeCurrentSection(section),
                      ),
                  ].spacedWith(const Divider(height: 0)),
                ),
              ),
            ),
            const VerticalDivider(
              width: 0,
            ),
            Expanded(
              child: _MainScreenBody(
                  currentSection: mainScreenCubit.state.currentSection),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Align(
            alignment: Alignment.topRight,
            child: OutlinedButton(
              onPressed: () async {
                await authCubit.logOut();
              },
              child: const Text('Log out'),
            ),
          ),
        ),
      ],
    ));
  }
}

class _MainScreenBody extends StatelessWidget {
  const _MainScreenBody({
    Key? key,
    required this.currentSection,
  }) : super(key: key);

  final MainScreenSection currentSection;

  @override
  Widget build(BuildContext context) {
    switch (currentSection) {
      case MainScreenSection.products:
        return const ProductsScreen();
      case MainScreenSection.categories:
        return const Center(
          child: Text('Categories'),
        );

      case MainScreenSection.users:
        return const Center(
          child: Text('Users'),
        );
      case MainScreenSection.orders:
        return const Center(
          child: Text('Orders'),
        );
    }
  }
}

class MainPage extends MaterialPage<void> {
  MainPage()
      : super(
          child: BlocProvider(
            create: (context) => MainScreenCubit(),
            child: const MainScreen(),
          ),
        );
}
