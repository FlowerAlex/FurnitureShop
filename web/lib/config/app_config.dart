class AppConfig {
  AppConfig({
    required this.debugMode,
    required this.apiUri,
  });

  final bool debugMode;
  final Uri apiUri;
}
