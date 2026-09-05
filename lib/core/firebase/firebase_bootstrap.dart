import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reyy_cinema/core/firebase/firebase_remote_config_service.dart';
import 'package:reyy_cinema/firebase_options.dart';

class FirebaseBootstrap {
  FirebaseBootstrap._();

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseRemoteConfigService.instance.init();
    } catch (e, st) {
      debugPrint('Firebase belum siap: $e');
      debugPrintStack(stackTrace: st);
    }
  }
}
