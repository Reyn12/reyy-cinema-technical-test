import 'package:dio/dio.dart';

import 'api/auth_interceptor.dart';
import 'environment.dart';

Dio buildDioClient() {
  final baseUrl = apiBaseUrlOverride.isNotEmpty
      ? apiBaseUrlOverride
      : switch (appMode) {
          AppEnvironment.local => localBaseUrl,
          AppEnvironment.staging => stagingBaseUrl,
          AppEnvironment.production => productionBaseUrl,
        };

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  dio.interceptors.add(AuthInterceptor());
  return dio;
}
