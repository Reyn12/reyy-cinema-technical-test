import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class ProfileMenuItemData {
  const ProfileMenuItemData({
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  final String iconPath;
  final String title;
  final VoidCallback? onTap;
}

class WProfileMenuItem extends StatelessWidget {
  const WProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
    this.showDivider = true,
  });

  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    spacing: 10,
                    children: [
                      ImageLoad(
                        src: iconPath,
                        width: 32,
                        height: 32,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: AppTypography.bodySemiboldM.copyWith(
                            color: AppColors.neutral100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ImageLoad(
                  src: Assets.icons.icRightProfile.path,
                  width: 24,
                  height: 24,
                  color: AppColors.neutral80,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(color: AppColors.neutral20, height: 1),
      ],
    );
  }
}

class WProfileMenuSection extends StatelessWidget {
  const WProfileMenuSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<ProfileMenuItemData> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            title,
            style: AppTypography.h9Bold.copyWith(
              color: AppColors.neutral90,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.neutral10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 16,
              children: [
                for (var i = 0; i < items.length; i++)
                  WProfileMenuItem(
                    iconPath: items[i].iconPath,
                    title: items[i].title,
                    onTap: items[i].onTap,
                    showDivider: i != items.length - 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
