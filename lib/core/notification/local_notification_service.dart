import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Prepared buat foreground/local notif. Nanti tinggal dipanggil dari FCM.
class LocalNotificationService {
  LocalNotificationService._();

  static final LocalNotificationService instance =
      LocalNotificationService._();

  static const String androidChannelId = 'reyy_cinema_high_importance';
  static const String androidChannelName = 'Reyy Cinema Notifications';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _ready = false;

  bool get isReady => _ready;

  Future<void> init() async {
    if (_ready) return;

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

    await _plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    await _createAndroidChannel();
    await _requestPermissions();
    _ready = true;
  }

  Future<void> _createAndroidChannel() async {
    if (!Platform.isAndroid) return;

    const channel = AndroidNotificationChannel(
      androidChannelId,
      androidChannelName,
      description: 'Notifikasi penting Reyy Cinema',
      importance: Importance.high,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
      return;
    }

    if (Platform.isIOS) {
      await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  void _onNotificationTap(NotificationResponse response) {
    debugPrint('Notification tapped: ${response.payload}');
  }

  /// Dipakai nanti saat FCM foreground message masuk.
  Future<void> show({
    required String title,
    required String body,
    String? payload,
    int id = 0,
  }) async {
    if (!_ready) await init();

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

    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
      payload: payload,
    );
  }
}
