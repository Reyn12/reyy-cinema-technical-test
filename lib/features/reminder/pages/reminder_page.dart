import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/features/reminder/bloc/reminder_bloc.dart';
import 'package:reyy_cinema/features/reminder/bloc/reminder_event.dart';
import 'package:reyy_cinema/features/reminder/bloc/reminder_state.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_active_badge.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_list_builder.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_list_shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/empty_state.dart';
import 'package:reyy_cinema/widget/info_card.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReminderBloc(),
      child: const ReminderView(),
    );
  }
}

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

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
              title: 'Pengingat Notifikasi',
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
              child: RefreshIndicator(
                color: AppColors.primaryPressed,
                onRefresh: () async {
                  final bloc = context.read<ReminderBloc>();
                  bloc.add(const ReminderLoadRequested());
                  await bloc.stream.firstWhere((state) => !state.isLoading);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: BlocBuilder<ReminderBloc, ReminderState>(
                    builder: (context, state) {
                      return Column(
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
                                  if (!state.isLoading && !state.hasError)
                                    WReminderActiveBadge(
                                      count: state.activeCount,
                                    ),
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
                          PrimaryButton.btnTambahPengingat(
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
                          if (state.isLoading)
                            const WReminderListShimmer()
                          else if (state.hasError)
                            WHomeSectionRetry(
                              message: 'Gagal memuat pengingat',
                              onRetry: () => context.read<ReminderBloc>().add(
                                const ReminderLoadRequested(),
                              ),
                            )
                          else if (state.items.isEmpty)
                            const EmptyState(
                              title: 'Belum ada pengingat',
                              subtitle:
                                  'Tambah pengingat biar jadwal tontonmu nggak kelewat',
                            )
                          else
                            WReminderListBuilder(items: state.items),
                        ],
                      );
                    },
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
