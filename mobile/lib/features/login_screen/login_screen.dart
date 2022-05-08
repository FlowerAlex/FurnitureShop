import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_form_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_button.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/features/login_screen/login_screen_cubit.dart';
import 'package:furniture_shop/features/sign_up_screen.dart/sign_up_screen.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var obscurePassword = true;
  final _loginTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _onLogInPressed() {
      if (_formKey.currentState?.validate() ?? false) {
        context.read<LogInScreenCubit>().logIn(
              _loginTextEditingController.text,
              _passwordTextEditingController.text,
            );
      }
    }

    bool hasError(LogInScreenState state) {
      return state.invalidCredentials ||
          state.networkError ||
          state.unknownError;
    }

    String getTextForLogInError(LogInScreenState state) {
      if (state.invalidCredentials) {
        return 'Invalid credentials';
      }
      if (state.networkError) {
        return 'Network error';
      }
      if (state.unknownError) {
        return 'Unknown error';
      }
      return '';
    }

    return BlocBuilder<LogInScreenCubit, LogInScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SafeArea(
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    child: Column(
                      children: [
                        Expanded(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Align(
                                  child: Text('Log in'),
                                ),
                                const SizedBox(height: 36),
                                AppTextFormField(
                                  controller: _loginTextEditingController,
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  autofillHints: const [AutofillHints.email],
                                  validator: Validators.compose([
                                    Validators.required('Field must be filled'),
                                    Validators.email('Bad email format'),
                                  ]),
                                  label: 'Email',
                                ),
                                const SizedBox(height: 20),
                                AppTextFormField(
                                  controller: _passwordTextEditingController,
                                  obscureText: obscurePassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  autocorrect: false,
                                  autofillHints: const [AutofillHints.password],
                                  validator: Validators.compose([
                                    Validators.required('Field must be filled'),
                                    Validators.minLength(
                                        8, 'Password too short'),
                                  ]),
                                  label: 'Password',
                                  suffixIcon: AssetButton(
                                    icon: AssetIcon(
                                      asset: Assets.icons.eye,
                                      color: AppColors.grey5,
                                    ),
                                    onPressed: () => setState(() {
                                      obscurePassword = !obscurePassword;
                                    }),
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
                                  onPressed: _onLogInPressed,
                                  child: Text(
                                    'Log in',
                                    style: AppTextStyles.reg12.copyWith(
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                ),
                                if (hasError(state))
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Align(
                                      child: Text(
                                        getTextForLogInError(state),
                                        style: AppTextStyles.reg12.copyWith(
                                          color: AppColors.errorRed,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const Align(
                          child: Text('Don\'t have account?'),
                        ),
                        const SizedBox(height: 20),
                        AppTextButton(
                          onPressed: () =>
                              Navigator.of(context).push(SignUpPage()),
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
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _loginTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
}

class LoginPage extends MaterialPage<void> {
  LoginPage()
      : super(
          child: BlocProvider(
            create: (context) => LogInScreenCubit(
              authCubit: context.read<AuthCubit>(),
            ),
            child: const LoginScreen(),
          ),
        );
}
