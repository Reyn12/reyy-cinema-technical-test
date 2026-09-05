import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/core/firebase/firebase_bootstrap.dart';
import 'package:reyy_cinema/core/notification/local_notification_service.dart';
import 'package:reyy_cinema/core/notification/push_notification_service.dart';
import 'package:reyy_cinema/network/environment.dart';

import 'features/auth/bloc/auth_bloc.dart';
import 'resources/app_theme.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseBootstrap.init();
  await LocalNotificationService.instance.init();
  await PushNotificationService.instance.init();

  runApp(
    devicePreview
        ? DevicePreview(enabled: true, builder: (context) => const MainApp())
        : const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: appRouter,
        locale: devicePreview ? DevicePreview.locale(context) : null,
        builder: devicePreview ? DevicePreview.appBuilder : null,
      ),
    );
  }
}
