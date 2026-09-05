import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WBioskopCinemaInfoCard extends StatelessWidget {
  const WBioskopCinemaInfoCard({
    super.key,
    required this.cinemaName,
    required this.statusLabel,
    required this.openHours,
    required this.distanceLabel,
    required this.durationLabel,
    required this.onTapBookmark,
    required this.onTapStartNavigation,
    required this.onTapSeeSchedule,
    this.isSelected = true,
  });

  final String cinemaName;
  final String statusLabel;
  final String openHours;
  final String distanceLabel;
  final String durationLabel;
  final bool isSelected;
  final VoidCallback onTapBookmark;
  final VoidCallback onTapStartNavigation;
  final VoidCallback onTapSeeSchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            children: [
              if (isSelected) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Terpilih',
                    style: AppTypography.bodySemiboldS.copyWith(
                      color: AppColors.primaryPressed,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: statusLabel,
                              style: AppTypography.bodySemiboldS.copyWith(
                                color: AppColors.success,
                              ),
                            ),
                            TextSpan(
                              text: ' • $openHours',
                              style: AppTypography.bodyRegularS.copyWith(
                                color: AppColors.textColor60,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTapBookmark,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primarySurface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.bookmark_border_rounded,
                    size: 20,
                    color: AppColors.primaryPressed,
                  ),
                ),
              ),
            ],
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cinemaName,
                style: AppTypography.h8Bold.copyWith(
                  color: AppColors.primaryPressed,
                ),
              ),
              Row(
                children: [
                  Assets.icons.icRange.svg(
                    width: 14,
                    height: 14,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryPressed,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      '$distanceLabel • $durationLabel',
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor60,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: PrimaryButton.withIcon(
                  text: 'Mulai Navigasi',
                  height: 44,
                  color: AppColors.primaryLight,
                  textColor: AppColors.primaryPressed,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  leading: Assets.icons.icStartNavigation.svg(
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryPressed,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onTapStartNavigation,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton.withIcon(
                  text: 'Lihat Jadwal',
                  height: 44,
                  color: AppColors.primaryPressed,
                  textColor: AppColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  leading: Assets.icons.icSeeSchedule.svg(
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onTapSeeSchedule,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
