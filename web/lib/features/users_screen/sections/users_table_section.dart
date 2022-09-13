import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/users_screen/users_screen_cubit.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:furniture_shop/utils/table_section.dart';

class UsersTableSection extends StatelessWidget {
  const UsersTableSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UsersScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersScreenCubit>();

    return TableSection<UserInfoDTO>(
      title: 'Users list',
      items: state.currentPageUsers,
      currentPage: state.currentPage,
      totalCount: state.totalCount,
      onPrevPressed: () => cubit.fetch(page: state.currentPage - 1),
      onNextPressed: () => cubit.fetch(page: state.currentPage + 1),
      itemBuilder: (user) => _UserItem(
        user: user,
        onBanPressed: () => cubit.banUser(
            'user.id',), // TODO: use id when will be added on the backend
        onUnbanPressed: () => cubit.unbanUser(
            'user.id',), // TODO: use id when will be added on the backend
      ),
    );
  }
}

class _UserItem extends StatelessWidget {
  const _UserItem({
    Key? key,
    required this.user,
    this.onBanPressed,
    this.onUnbanPressed,
  }) : super(key: key);

  final UserInfoDTO user;
  final VoidCallback? onUnbanPressed;
  final VoidCallback? onBanPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Column(
            children: [
              Text(user.firstname),
              Text(user.surname),
            ],
          ),
          Column(
            children: [
              Text('Username:${user.username}'),
              Text(user.emailAddress),
            ],
          ),
          const Spacer(),
          Text(user.isBanned ? 'Unban user: ' : 'Ban user: '),
          const SizedBox(width: 12),
          IconButton(
            onPressed: user.isBanned ? onBanPressed : onUnbanPressed,
            icon: user.isBanned
                ? Assets.icons.banUser.svg()
                : Assets.icons.unbanUser.svg(),
          ),
        ],
      ),
    );
  }
}
