import 'package:cqrs/cqrs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/app.dart';
import 'package:furniture_shop/config/app_config.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:logging/logging.dart';
import 'package:login_client/login_client.dart';
import 'package:login_client_flutter/login_client_flutter.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupLogger(config);

  final loginClient = LoginClient(
    oAuthSettings: OAuthSettings(
      authorizationUri: config.apiUri.resolve('/auth/connect/token'),
      clientId: 'client_app',
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

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: cqrs),
        BlocProvider(
          lazy: false,
          create: (context) => AuthCubit(loginClient)..initialize(),
        ),
      ],
      builder: (context, _) => const App(),
    ),
  );
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
