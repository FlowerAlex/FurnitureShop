import 'package:furniture_shop/config/app_config.dart';
import 'package:furniture_shop/main_common.dart';

void main() {
  final config = AppConfig(
      debugMode: true, apiUri: Uri.parse('https://afd6-194-29-137-1.ngrok.io'));
  mainCommon(config);
}
