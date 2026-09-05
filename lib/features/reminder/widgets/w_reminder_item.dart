import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WReminderItem extends StatelessWidget {
  const WReminderItem({
    super.key,
    required this.item,
    this.onTap,
  });

  final ReminderModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            ImageLoad(
              src: Assets.icons.icNotifItem.path,
              isAsset: true,
              width: 40,
              height: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    item.title,
                    style: AppTypography.bodySemiboldM.copyWith(
                      color: AppColors.neutral100,
                    ),
                  ),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.neutral60,
                    ),
                  ),
                  Text(
                    item.createdAtLabel,
                    style: AppTypography.bodyRegularXs.copyWith(
                      color: AppColors.neutral60,
                    ),
                  ),
                ],
              ),
            ),
            if (!item.isRead)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
