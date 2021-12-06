import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/features/main_screen/main_screen_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, Screen>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.grey0.withAlpha(122),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: state.index,
          onTap: (index) =>
              context.read<MainScreenCubit>().goTo(Screen.values[index]),
          items: [
            BottomNavigationBarItem(
              activeIcon: AssetIcon(
                asset: Assets.icons.squares,
                active: state.index == 0,
              ),
              icon: AssetIcon(asset: Assets.icons.squares),
              label: 'BottomNavigationBarItem_Squares',
            ),
            BottomNavigationBarItem(
              activeIcon: AssetIcon(
                asset: Assets.icons.heart,
                active: state.index == 1,
              ),
              icon: AssetIcon(asset: Assets.icons.heart),
              label: 'BottomNavigationBarItem_Favorites',
            ),
            BottomNavigationBarItem(
              activeIcon: AssetIcon(
                asset: Assets.icons.backet,
                active: state.index == 2,
              ),
              icon: AssetIcon(asset: Assets.icons.backet),
              label: 'BottomNavigationBarItem_Backet',
            ),
            BottomNavigationBarItem(
              activeIcon: AssetIcon(
                asset: Assets.icons.user,
                active: state.index == 3,
              ),
              icon: AssetIcon(asset: Assets.icons.user),
              label: 'BottomNavigationBarItem_User',
            ),
          ],
        );
      },
    );
  }
}
