import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService._();

  static final LocalNotificationService instance =
      LocalNotificationService._();

  static const String androidChannelId = 'reyy_cinema_high_importance';
  static const String androidChannelName = 'Reyy Cinema Notifications';

  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  bool ready = false;

  bool get isReady => ready;

  Future<void> init() async {
    if (ready) return;

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
    );

    await createAndroidChannel();
    await requestPermissions();
    ready = true;
  }

  Future<void> createAndroidChannel() async {
    if (!Platform.isAndroid) return;

    const channel = AndroidNotificationChannel(
      androidChannelId,
      androidChannelName,
      description: 'Notifikasi penting Reyy Cinema',
      importance: Importance.high,
    );

    await plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      await plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
      return;
    }

    if (Platform.isIOS) {
      await plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  void onNotificationTap(NotificationResponse response) {}

  Future<void> show({
    required String title,
    required String body,
    String? payload,
    int id = 0,
  }) async {
    if (!ready) await init();

    const androidDetails = AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
      channelDescription: 'Notifikasi penting Reyy Cinema',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
      payload: payload,
    );
  }
}
