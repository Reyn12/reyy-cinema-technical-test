import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_bloc.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_event.dart';
import 'package:reyy_cinema/features/profile/bloc/profile_bloc.dart';
import 'package:reyy_cinema/features/profile/bloc/profile_event.dart';
import 'package:reyy_cinema/features/profile/bloc/profile_state.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_background_header.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_header.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_info_card.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_info_card_shimmer.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_logout_bottom_sheet.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_menu_section.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_section_error.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/core/notification/push_notification_service.dart';
import 'package:reyy_cinema/widget/bottom_sheet_helper.dart';
import 'package:reyy_cinema/widget/loading_dialog.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final scrollController = ScrollController();

  Future<void> onLogoutTap(BuildContext context) async {
    final confirmed = await BottomSheetHelper.showBar<bool>(
      context,
      builder: (_) => const WProfileLogoutBottomSheet(),
    );

    if (confirmed != true || !context.mounted) return;

    context.read<AuthBloc>().add(const AuthLoggedOut());
    context.go(AppPaths.login);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            const WProfileHeader(),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryPressed,
                onRefresh: () async {
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(0);
                  }
                  context.read<ProfileBloc>().add(const ProfileLoadRequested());
                  await context.read<ProfileBloc>().stream.firstWhere(
                    (state) => !state.isLoading,
                  );
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const WProfileBackgroundHeader(),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state.isLoading) {
                                return const WProfileInfoCardShimmer();
                              }

                              if (state.hasError || state.profile == null) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 48),
                                  child: WProfileSectionError(
                                    onRetry: () => context
                                        .read<ProfileBloc>()
                                        .add(const ProfileLoadRequested()),
                                  ),
                                );
                              }

                              final profile = state.profile!;
                              return WProfileInfoCard(
                                name: profile.name,
                                email: profile.email,
                                memberLabel: profile.memberLabel,
                                watchedCount: '${profile.watchedCount}',
                                reminderCount: '${profile.reminderCount}',
                                loyaltyPoint: '${profile.loyaltyPoint}',
                                avatarSrc:
                                    profile.avatarUrl ??
                                    Assets.images.imgProfilePicDummy.path,
                              );
                            },
                          ),
                        ],
                      ),
                      WProfileMenuSection(
                        title: 'Help & Information',
                        items: [
                          ProfileMenuItemData(
                            iconPath: Assets.icons.icSnk.path,
                            title: 'Syarat dan Ketentuan',
                            onTap: () => context.push(AppPaths.terms),
                          ),
                          ProfileMenuItemData(
                            iconPath: Assets.icons.icFaq.path,
                            title: 'FAQ',
                            onTap: () => context.push(AppPaths.faq),
                          ),
                          ProfileMenuItemData(
                            iconPath: Assets.icons.icAboutApp.path,
                            title: 'Tentang Aplikasi',
                            onTap: () => context.push(AppPaths.aboutApp),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: PrimaryButton(
                          text: 'Testing Push Notifikasi',
                          color: AppColors.primaryPressed,
                          onPressed: () async {
                            LoadingDialog.show(context);
                            await Future<void>.delayed(
                              const Duration(milliseconds: 500),
                            );
                            await PushNotificationService.instance
                                .showDummyNotification();
                            if (!context.mounted) return;
                            LoadingDialog.hide(context);
                          },
                        ),
                      ),
                      FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        builder: (context, snapshot) {
                          final version = snapshot.data?.version ?? '-';
                          return Text(
                            'Versi $version',
                            style: AppTypography.bodyRegularS.copyWith(
                              color: AppColors.neutral100,
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
                        child: PrimaryButton(
                          text: 'Keluar',
                          color: AppColors.error,
                          onPressed: () => onLogoutTap(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
