import 'package:dio/dio.dart';

import '../../core/event_bus/app_event_bus.dart';
import '../../core/event_bus/events/session_expired_event.dart';
import '../../features/auth/storage/auth_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await AuthStorage().getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      AppEventBus.instance.fire(const SessionExpiredEvent());
    }
    handler.next(err);
  }
}
