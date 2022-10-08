import 'package:cqrs/cqrs.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';

class AppCQRS extends CQRS {
  AppCQRS(
    super.client,
    super.apiUri, {
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Future<T> get<T>(
    Query<T> query, {
    Map<String, String> headers = const {},
  }) async {
    try {
      return await super.get(
        query,
        headers: headers,
      );
    } on CQRSException catch (err) {
      if (err.response.statusCode == 403) {
        authCubit.updateState(AuthState.banned);
      }
      rethrow;
    }
  }

  @override
  Future<CommandResult> run(
    Command command, {
    Map<String, String> headers = const {},
  }) async {
    try {
      return await super.run(command, headers: headers);
    } on CQRSException catch (err) {
      if (err.response.statusCode == 403) {
        authCubit.updateState(AuthState.banned);
      }
      rethrow;
    }
  }
}
