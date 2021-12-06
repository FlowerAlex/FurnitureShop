import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/common/app_page_route.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_button.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/features/main_screen/main_screen.dart';
import 'package:furniture_shop/features/sign_up_screen.dart/sign_up_screen.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obscureText = useState<bool>(true);
    final loginTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Align(
                      child: Text('Log in'),
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
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot password?',
                          style: AppTextStyles.reg12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    AppTextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => MainScreen(),
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: AppTextStyles.reg12.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                child: Text('Don\'t have account?'),
              ),
              const SizedBox(height: 20),
              AppTextButton(
                onPressed: () => Navigator.of(context).push(SignUpPage()),
                child: Text(
                  'Sign up',
                  style: AppTextStyles.reg12.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends AppPageRoute<void> {
  LoginPage() : super(builder: (_) => const LoginScreen());
}
