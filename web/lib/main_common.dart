import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/config/app_config.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/auth/auth_router.dart';
import 'package:furniture_shop/features/auth/flutter_secure_credentials_storage.dart';
import 'package:furniture_shop/resources/app_theme.dart';
import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:logging/logging.dart';
import 'package:login_client/login_client.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupLogger(config);

  final loginClient = LoginClient(
    oAuthSettings: OAuthSettings(
      authorizationUri: config.apiUri.resolve('/auth/connect/token'),
      clientId: 'admin_app',
      scopes: [
        'internal_api',
        'offline_access',
      ],
    ),
    credentialsStorage: const FlutterSecureCredentialsStorage(),
  );

  await loginClient.initialize();

  final cqrs = CQRS(
    loginClient,
    config.apiUri.resolve('/api/'),
  );

  runApp(MultiProvider(
    providers: [
      Provider.value(value: cqrs),
      BlocProvider(
        lazy: false,
        create: (context) => AuthCubit(loginClient)..initialize(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture Shop Web',
      theme: AppTheme.getTheme(AppThemeType.light),
      home: const AuthRouter(),
    );
  }
}

Future<void> _setupLogger(AppConfig config) async {
  if (config.debugMode) {
    Logger.root.level = Level.ALL;
    // ignore: avoid_print
    Logger.root.onRecord.listen(print);
  }

  final flutterErrorLogger = Logger('FlutterError');

  FlutterError.onError = (details) {
    if (config.debugMode == true) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      flutterErrorLogger.warning(
        details.summary.name,
        details.exception,
        details.stack,
      );
    }
  };
}
