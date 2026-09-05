import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_info_avatar.dart';
import 'package:reyy_cinema/features/profile/widgets/w_profile_stat_item.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WProfileInfoCard extends StatelessWidget {
  const WProfileInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.memberLabel,
    required this.watchedCount,
    required this.reminderCount,
    required this.loyaltyPoint,
    this.avatarSrc,
    this.onTapEditProfile,
  });

  final String name;
  final String email;
  final String memberLabel;
  final String watchedCount;
  final String reminderCount;
  final String loyaltyPoint;
  final String? avatarSrc;
  final VoidCallback? onTapEditProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 48),
            padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppShadows.soft,
            ),
            child: Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: AppTypography.h9Bold.copyWith(
                    color: AppColors.primaryPressed,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyRegularS.copyWith(
                    color: AppColors.textColor50,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.icMember.svg(width: 18, height: 18),
                      const SizedBox(width: 6),
                      Text(
                        memberLabel,
                        style: AppTypography.bodySemiboldS.copyWith(
                          color: AppColors.primaryPressed,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: WProfileStatItem(
                          value: watchedCount,
                          label: 'Ditonton',
                          icon: Assets.icons.icDitonton.svg(
                            width: 13,
                            height: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: WProfileStatItem(
                          value: reminderCount,
                          label: 'Pengingat',
                          icon: Assets.icons.icProfileReminder.svg(
                            width: 13,
                            height: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: WProfileStatItem(
                          value: loyaltyPoint,
                          label: 'Poin Loyalti',
                          icon: Assets.icons.icLoyalityPoint.svg(
                            width: 13,
                            height: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          WProfileInfoAvatar(
            avatarSrc: avatarSrc,
            onTapEditProfile: onTapEditProfile,
          ),
        ],
      ),
    );
  }
}
