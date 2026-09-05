import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_bloc.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_event.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_state.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/image_load.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state) {
          case AuthAuthenticated():
            context.go(AppPaths.mainNavigation);
          case AuthUnauthenticated():
            context.go(AppPaths.login);
          case AuthInitial():
          case AuthLoading():
          case AuthOnboardingRequired():
            break;
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              ImageLoad(
                src: Assets.images.imgDummyBoarding.path,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              DecoratedBox(
                decoration: BoxDecoration(gradient: AppGradients.onboarding),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    children: [
                      const Spacer(),
                      ImageLoad(
                        src: Assets.icons.icLogoApp.path,
                        width: 72,
                        height: 72,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Nonton Jadi Lebih Gampang',
                        textAlign: TextAlign.center,
                        style: AppTypography.h7Bold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Cari film, cek jadwal tayang, sampai pesan tiket semua dalam satu aplikasi',
                        textAlign: TextAlign.center,
                        style: AppTypography.bodyRegularM.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      PrimaryButton(
                        text: 'Mulai Sekarang',
                        onPressed: () => context.read<AuthBloc>().add(
                          const AuthOnboardingCompleted(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
