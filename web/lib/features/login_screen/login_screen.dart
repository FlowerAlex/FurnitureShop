import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/login_screen/login_screen_cubit.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final loginFormKey = useMemoized(GlobalKey<FormState>.new);
    final obscurePassword = useState(true);

    final loginTextEditingController = useMemoized(TextEditingController.new);
    final passwordTextEditingController =
        useMemoized(TextEditingController.new);

    final cubit = context.watch<LogInScreenCubit>();

    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: Align(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Furniture shop web app',
                  style: theme.textTheme.headline5,
                ),
                TextFormField(
                  controller: loginTextEditingController,
                  decoration: const InputDecoration(hintText: 'Login'),
                  autofocus: true,
                  validator: Validators.compose([
                    Validators.required('Email address should not be empty'),
                    Validators.email('Invalid email address'),
                  ]),
                ),
                TextFormField(
                  controller: passwordTextEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: obscurePassword.value,
                  autofocus: true,
                  validator: Validators.compose([
                    Validators.required("Password can't be empty"),
                  ]),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: obscurePassword.value,
                      onChanged: (value) {
                        if (value != null) {
                          obscurePassword.value = value;
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    const Text('Hide password'),
                  ],
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (loginFormKey.currentState!.validate()) {
                      await cubit.logIn(
                        loginTextEditingController.text,
                        passwordTextEditingController.text,
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
                if (cubit.state.networkError)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Network Error Occurred',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.errorColor),
                    ),
                  ),
                if (cubit.state.unknownError)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Error: ${cubit.state.errorText}',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.errorColor),
                    ),
                  ),
              ].spaced(20),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends MaterialPage<void> {
  LoginPage()
      : super(
          child: BlocProvider(
            create: (context) => LogInScreenCubit(
              authCubit: context.read(),
            ),
            child: const LoginScreen(),
          ),
        );
}
