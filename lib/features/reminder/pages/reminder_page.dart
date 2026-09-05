import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_active_badge.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_list_builder.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/info_card.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            AppHeader(
              title: 'Reminder',
              leading: canPop
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    )
                  : null,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Daftar Pengingat',
                                style: AppTypography.h9Bold.copyWith(
                                  color: AppColors.primaryPressed,
                                ),
                              ),
                            ),
                            const WReminderActiveBadge(count: 3),
                          ],
                        ),
                        Text(
                          'Kelola jadwal tonton dan notifikasi tiket film favoritmu.',
                          style: AppTypography.bodyRegularS.copyWith(
                            color: AppColors.textColor50,
                          ),
                        ),
                      ],
                    ),
                    PrimaryButton.withIcon(
                      text: 'Tambah Pengingat',
                      leading: Assets.icons.icAddReminder.svg(
                        width: 18,
                        height: 18,
                      ),
                      onPressed: () {
                        CustomSnackbar.info(
                          context,
                          'Fitur Add Reminder belum tersedia',
                        );
                      },
                    ),
                    const InfoCard(
                      message:
                          'Notifikasi akan dikirim 2 jam sebelum film dimulai via Push Notification & Kalender perangkat.',
                    ),
                    const WReminderListBuilder(),
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
