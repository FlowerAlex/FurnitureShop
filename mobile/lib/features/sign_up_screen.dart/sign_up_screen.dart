import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/common/app_page_route.dart';
import 'package:furniture_shop/features/common/widgets/app_back_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_button.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obscureText = useState<bool>(true);
    final loginTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();
    final repeatPasswordTextEditingController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Container(
                width: 40,
                height: 40,
                child: AppBackButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    child: Text('Sign up'),
                  ),
                  const SizedBox(height: 36),
                  AppTextField(
                    controller: loginTextEditingController,
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: passwordTextEditingController,
                    label: 'Password',
                    obscureText: obscureText.value,
                    suffixIcon: AssetButton(
                      splashRadius: 8,
                      icon: AssetIcon(
                        asset: Assets.icons.eye,
                        color: AppColors.grey5,
                      ),
                      onPressed: () => obscureText.value = !obscureText.value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: repeatPasswordTextEditingController,
                    label: 'Repeat password',
                    obscureText: obscureText.value,
                    suffixIcon: AssetButton(
                      splashRadius: 8,
                      icon: AssetIcon(
                        asset: Assets.icons.eye,
                        color: AppColors.grey5,
                      ),
                      onPressed: () => obscureText.value = !obscureText.value,
                    ),
                  ),
                  const SizedBox(height: 36),
                  AppTextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.reg12.copyWith(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends AppPageRoute<void> {
  SignUpPage() : super(builder: (context) => const SignUpScreen());
}
