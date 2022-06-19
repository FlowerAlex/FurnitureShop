import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_client/login_client.dart';

/// A `flutter_secure_storage` implementation of the [CredentialsStorage].
class FlutterSecureCredentialsStorage implements CredentialsStorage {
  /// Creates the [CredentialsStorage].
  const FlutterSecureCredentialsStorage();

  static const _key = 'login_client_flutter_credentials';
  FlutterSecureStorage get _storage => const FlutterSecureStorage();

  @override
  Future<Credentials?> read() async {
    final json = await _storage.read(key: _key);
    if (json == null) {
      return null;
    }

    try {
      return Credentials.fromJson(json);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(Credentials credentials) {
    return _storage.write(key: _key, value: credentials.toJson());
  }

  @override
  Future<void> clear() {
    return _storage.delete(key: _key);
  }
}
