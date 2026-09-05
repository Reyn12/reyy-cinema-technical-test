import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:reyy_cinema/core/notification/local_notification_service.dart';
import 'package:reyy_cinema/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class PushNotificationService {
  PushNotificationService._();

  static final PushNotificationService instance = PushNotificationService._();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  bool ready = false;
  String? fcmToken;

  Future<void> init() async {
    if (ready) return;
    if (Firebase.apps.isEmpty) return;

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    await messaging.requestPermission(alert: true, badge: true, sound: true);

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    fcmToken = await messaging.getToken();

    messaging.onTokenRefresh.listen((token) {
      fcmToken = token;
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

  void handleMessageOpened(RemoteMessage message) {}

  Future<void> showDummyNotification() async {
    await LocalNotificationService.instance.show(
      title: 'Reyy Cinema',
      body: 'HIDUP JOKOWI - Ini dummy push notification untuk testing',
      payload: 'dummy_push_test',
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
    );
  }
}
