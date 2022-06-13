import 'package:furniture_shop/config/app_config.dart';
import 'package:furniture_shop/main_common.dart';

void main() {
  final config = AppConfig(
      debugMode: true, apiUri: Uri.parse('https://79f1-5-173-153-28.ngrok.io'));
  mainCommon(config);
}
