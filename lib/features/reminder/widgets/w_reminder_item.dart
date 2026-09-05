import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/reminder/models/film_reminder_item_model.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_countdown_badge.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_meta_row.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_status_badge.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/image_load.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WReminderItem extends StatelessWidget {
  const WReminderItem({super.key, required this.item});

  final FilmReminderItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        spacing: 14,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ImageLoad(
                  src: item.image.path,
                  isAsset: true,
                  width: 88,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        WReminderStatusBadge(status: item.status),
                        WReminderCountdownBadge(label: item.countdownLabel),
                      ],
                    ),
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.h10Bold.copyWith(
                        color: AppColors.primaryPressed,
                      ),
                    ),
                    Text(
                      item.genresDuration,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                    WReminderMetaRow(
                      icon: Icons.calendar_month_rounded,
                      iconColor: AppColors.info,
                      text: item.scheduleLabel,
                    ),
                    WReminderMetaRow(
                      icon: Icons.location_on_outlined,
                      iconColor: AppColors.textColor50,
                      text: item.locationLabel,
                    ),
                  ],
                ),
              ),
            ],
          ),
          switch (item.action) {
            ReminderItemAction.viewTicket => Row(
              children: [
                Expanded(
                  child: PrimaryButton.btnAturNotification(
                    onPressed: () {
                      CustomSnackbar.info(
                        context,
                        'Fitur Atur Notifikasi belum tersedia',
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PrimaryButton.btnLihatTiket(
                    onPressed: () {
                      CustomSnackbar.info(
                        context,
                        'Fitur Lihat Tiket belum tersedia',
                      );
                    },
                  ),
                ),
              ],
            ),
            ReminderItemAction.changeSchedule => Row(
              children: [
                Expanded(
                  child: PrimaryButton.btnAturNotification(
                    onPressed: () {
                      CustomSnackbar.info(
                        context,
                        'Fitur Atur Notifikasi belum tersedia',
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PrimaryButton.btnUbahJadwal(
                    onPressed: () {
                      CustomSnackbar.info(
                        context,
                        'Fitur Ubah Jadwal belum tersedia',
                      );
                    },
                  ),
                ),
              ],
            ),
            ReminderItemAction.remindWhenReleased =>
              PrimaryButton.btnIngatkanSaatTiketDirilis(
                onPressed: () {
                  CustomSnackbar.info(
                    context,
                    'Fitur Ingatkan Saat Tiket Dirilis belum tersedia',
                  );
                },
              ),
          },
        ],
      ),
    );
  }
}
