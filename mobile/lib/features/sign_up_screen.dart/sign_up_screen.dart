import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/common/app_page_route.dart';
import 'package:furniture_shop/features/common/widgets/app_back_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_form_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_button.dart';
import 'package:furniture_shop/features/sign_up_screen.dart/sign_up_screen_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool obscureRepeatPassword = true;
  final _loginTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();
  final _repeatPasswordTextEditingController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSignUpPressed() {
      if (_formKey.currentState?.validate() ?? false) {
        context.read<SignUpScreenCubit>().registerUser(
              _loginTextEditingController.text,
              _passwordTextEditingController.text,
              _addressController.text,
            );
      }
    }

    String? Function(String?) theSamePasswords() {
      return (_) {
        if (_repeatPasswordTextEditingController.value.text.isEmpty) {
          return null;
        }
        if (_repeatPasswordTextEditingController.value.text !=
            _passwordTextEditingController.value.text) {
          return 'Passwords are not the same';
        } else {
          return null;
        }
      };
    }

    bool hasError(SignUpScreenState state) {
      return state.invalidCredentials ||
          state.networkError ||
          state.unknownError;
    }

    String getTextForSignUpError(SignUpScreenState state) {
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

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: SafeArea(
                  child: BlocBuilder<SignUpScreenCubit, SignUpScreenState>(
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: AppBackButton(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 56,
                                vertical: 20,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    child: Text('Sign up'),
                                  ),
                                  const SizedBox(height: 28),
                                  AppTextFormField(
                                    controller: _loginTextEditingController,
                                    keyboardType: TextInputType.emailAddress,
                                    autocorrect: false,
                                    autofillHints: const [AutofillHints.email],
                                    validator: Validators.compose([
                                      Validators.required(
                                        'Field must be filled',
                                      ),
                                      Validators.email('Bad email format'),
                                    ]),
                                    label: 'Email',
                                  ),
                                  const SizedBox(height: 12),
                                  AppTextFormField(
                                    controller: _passwordTextEditingController,
                                    label: 'Password',
                                    obscureText: obscurePassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    autocorrect: false,
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    validator: Validators.compose([
                                      Validators.required(
                                        'Field must be filled',
                                      ),
                                      Validators.minLength(
                                        8,
                                        'Password too short',
                                      ),
                                    ]),
                                    suffixIcon: AssetButton(
                                      icon: Assets.icons.eye,
                                      color: AppColors.grey5,
                                      onPressed: () => setState(() {
                                        obscurePassword = !obscurePassword;
                                      }),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  AppTextFormField(
                                    controller:
                                        _repeatPasswordTextEditingController,
                                    label: 'Repeat password',
                                    obscureText: obscureRepeatPassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    autocorrect: false,
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    validator: Validators.compose(
                                      [
                                        Validators.required(
                                          'Field must be filled',
                                        ),
                                        theSamePasswords(),
                                      ],
                                    ),
                                    suffixIcon: AssetButton(
                                      icon: Assets.icons.eye,
                                      color: AppColors.grey5,
                                      onPressed: () => setState(() {
                                        obscureRepeatPassword =
                                            !obscureRepeatPassword;
                                      }),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  AppTextFormField(
                                    controller: _addressController,
                                    label: 'Address',
                                    validator: Validators.compose(
                                      [
                                        Validators.required(
                                          'Field must be filled',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  AppTextButton(
                                    onPressed: onSignUpPressed,
                                    child: Text(
                                      'Sign up',
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
                                          getTextForSignUpError(state),
                                          style: AppTextStyles.reg12.copyWith(
                                            color: AppColors.errorRed,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _loginTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _repeatPasswordTextEditingController.dispose();
    super.dispose();
  }
}

class SignUpPage extends AppPageRoute<void> {
  SignUpPage()
      : super(
          builder: (context) => BlocProvider(
            create: (context) => SignUpScreenCubit(
              cqrs: context.read(),
              authCubit: context.read<AuthCubit>(),
            ),
            child: const SignUpScreen(),
          ),
        );
}
