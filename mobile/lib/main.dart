import 'package:furniture_shop/config/app_config.dart';
import 'package:furniture_shop/main_common.dart';

void main() {
  final config = AppConfig(
      debugMode: true,
      apiUri: Uri.parse('https://d7f6-91-202-125-36.ngrok.io'));
  mainCommon(config);
}
