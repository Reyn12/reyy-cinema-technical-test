enum AppEnvironment { local, staging, production }

final appMode = AppEnvironment.local;
final mockStatus = true;

const String localBaseUrl = 'http://127.0.0.1:3000/api/mobile';
const String stagingBaseUrl = 'https://api-staging.example.com/api/mobile';
const String productionBaseUrl = 'https://api.example.com/api/mobile';

const String appEnv = String.fromEnvironment(
  'APP_ENV',
  defaultValue: 'production',
);
const String apiBaseUrlOverride = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: '',
);

const bool devicePreview = false;
