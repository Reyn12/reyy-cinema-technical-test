import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:reyy_cinema/core/notification/local_notification_service.dart';
import 'package:reyy_cinema/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('FCM background: ${message.messageId}');
}

class PushNotificationService {
  PushNotificationService._();

  static final PushNotificationService instance = PushNotificationService._();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  bool ready = false;
  String? fcmToken;

  Future<void> init() async {
    if (ready) return;
    if (Firebase.apps.isEmpty) {
      debugPrint('PushNotification skip: Firebase belum di-init');
      return;
    }

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    final settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    debugPrint('FCM permission: ${settings.authorizationStatus}');

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    fcmToken = await messaging.getToken();
    debugPrint('FCM token: $fcmToken');

    messaging.onTokenRefresh.listen((token) {
      fcmToken = token;
      debugPrint('FCM token refresh: $token');
    });

    FirebaseMessaging.onMessage.listen(handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageOpened);

    final initial = await messaging.getInitialMessage();
    if (initial != null) {
      handleMessageOpened(initial);
    }

    ready = true;
  }

  Future<void> handleForegroundMessage(RemoteMessage message) async {
    final notification = message.notification;
    final title = notification?.title ?? message.data['title'] ?? 'Reyy Cinema';
    final body = notification?.body ?? message.data['body'] ?? '';

    await LocalNotificationService.instance.show(
      title: title,
      body: body,
      payload: message.data.toString(),
      id: message.hashCode,
    );
  }

  void handleMessageOpened(RemoteMessage message) {
    debugPrint('FCM opened: ${message.data}');
  }

  Future<void> showDummyNotification() async {
    await LocalNotificationService.instance.show(
      title: 'Reyy Cinema',
      body: 'Hidup Jokowi',
      payload: 'dummy_push_test',
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
    );
  }
}
