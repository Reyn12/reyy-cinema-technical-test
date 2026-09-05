import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_bloc.dart';
import 'package:reyy_cinema/features/auth/bloc/auth_event.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_background_header.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_header.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_info_card.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_logout_bottom_sheet.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_menu_section.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/bottom_sheet_helper.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  spacing: 16,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const WProfileBackgroundHeader(),
                        WProfileInfoCard(
                          name: 'Muhammad Renaldi Maulana',
                          email: 'muhammadrenaldi687@gmail.com',
                          memberLabel: 'Member Premiere Gold',
                          watchedCount: '12',
                          reminderCount: '3',
                          loyaltyPoint: '450',
                          avatarSrc: Assets.images.imgProfilePicDummy.path,
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
          ],
        ),
      ),
    );
  }
}
