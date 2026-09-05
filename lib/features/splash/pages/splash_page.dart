import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/core/firebase/app_update_service.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/image_load.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_event.dart';
import '../../auth/bloc/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      final needUpdate = await AppUpdateService.instance.checkAndShow(context);
      if (!mounted || needUpdate) return;

      context.read<AuthBloc>().add(const AuthCheckRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state) {
          case AuthAuthenticated():
            context.go(AppPaths.mainNavigation);
          case AuthOnboardingRequired():
            context.go(AppPaths.onboarding);
          case AuthUnauthenticated():
            context.go(AppPaths.login);
          case AuthInitial():
          case AuthLoading():
            break;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [ImageLoad(src: Assets.icons.icLogoApp.path)],
          ),
        ),
      ),
    );
  }
}
