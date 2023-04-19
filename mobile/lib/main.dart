import 'package:furniture_shop/config/app_config.dart';
import 'package:furniture_shop/main_common.dart';

void main() {
  final config = AppConfig(
    debugMode: true,
    apiUri: Uri.parse('https://03db-194-29-137-21.ngrok-free.app'),
  );
  mainCommon(config);
}
