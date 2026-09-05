enum AppEnvironment { local, staging, production }

final appMode = AppEnvironment.local;
final mockStatus = true;

const String localBaseUrl = 'http://127.0.0.1:3000/api/mobile';
const String stagingBaseUrl = 'https://swapi.dev/api/';
const String productionBaseUrl = 'https://swapi.dev/api/';
const String mapBoxToken =
    'pk.eyJ1IjoicmV5eTEyMjEiLCJhIjoiY210bzdpcnE2MGcyazJ6cGd4MzZvYXhwNCJ9.TJreMNQmodJrI123_9iPLw';

const String appEnv = String.fromEnvironment(
  'APP_ENV',
  defaultValue: 'production',
);
const String apiBaseUrlOverride = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: '',
);

const bool devicePreview = false;
