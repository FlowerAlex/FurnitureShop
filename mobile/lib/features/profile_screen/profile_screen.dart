import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen_cubit.dart';
import 'package:furniture_shop/features/profile_screen/update_profile_dialog.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nickNameEditingController = useTextEditingController();
    final nameEditingController = useTextEditingController();
    final surnameEditingController = useTextEditingController();
    final addressEditingController = useTextEditingController();

    final fieldEditingController = useTextEditingController();

    void editPhoto() {}

    void addFunds() {
      fieldEditingController.text = '';
      showUpdateProfileDialog<void>(
        context: context,
        title: 'Add funds',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('^[1-9][0-9]*'))
              ],
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () async {
                final fundsToAdd = int.tryParse(fieldEditingController.text);

                if (fundsToAdd != null && fundsToAdd > 0) {
                  await context.read<ProfileScreenCubit>().addFunds(fundsToAdd);
                }

                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void editNickname() {
      fieldEditingController.text = nickNameEditingController.text;
      showUpdateProfileDialog<void>(
        context: context,
        title: 'Nickname',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      username: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void editName() {
      fieldEditingController.text = nameEditingController.text;

      showUpdateProfileDialog<void>(
        context: context,
        title: 'Name',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      name: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void editSurname() {
      fieldEditingController.text = surnameEditingController.text;

      showUpdateProfileDialog<void>(
        context: context,
        title: 'Surname',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      surname: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void editAddress() {
      fieldEditingController.text = addressEditingController.text;

      showUpdateProfileDialog<void>(
        context: context,
        title: 'Address',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      address: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void logOut() {
      context.read<AuthCubit>().logOut();
    }

    return Scaffold(
      body: BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
        builder: (context, state) {
          return state.map(
            initial: (state) => Center(
              child: AppTextButton(
                onPressed: logOut,
                background: Colors.transparent,
                child: Text(
                  'Log out',
                  style: AppTextStyles.reg18.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
            loading: (state) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (state) {
              nickNameEditingController.text = state.userInfo.username;
              nameEditingController.text = state.userInfo.firstname;
              surnameEditingController.text = state.userInfo.surname;
              addressEditingController.text = state.userInfo.address;

              return SafeArea(
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Profile',
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(56, 24, 60, 0),
                        child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              Material(
                                color: AppColors.grey0,
                                borderRadius: BorderRadius.circular(48),
                                child: InkWell(
                                  onTap: editPhoto,
                                  customBorder: const CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 48,
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: AssetIcon(
                                        color: AppColors.primaryText,
                                        asset: Assets.icons.edit,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: addFunds,
                                    child: const Text('Add funds'),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    'Actual funds: ${state.userInfo.funds}',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: nickNameEditingController,
                                label: 'Nickname',
                                suffixIcon: IconButton(
                                  onPressed: editNickname,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: nameEditingController,
                                label: 'Name',
                                suffixIcon: IconButton(
                                  onPressed: editName,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: surnameEditingController,
                                label: 'Surname',
                                suffixIcon: IconButton(
                                  onPressed: editSurname,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: addressEditingController,
                                label: 'Address',
                                suffixIcon: IconButton(
                                  onPressed: editAddress,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextButton(
                                onPressed: logOut,
                                background: Colors.transparent,
                                child: Text(
                                  'Log out',
                                  style: AppTextStyles.reg18.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (state) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error:${state.error}'),
                  AppTextButton(
                    onPressed: logOut,
                    background: Colors.transparent,
                    child: Text(
                      'Log out',
                      style: AppTextStyles.reg18.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
