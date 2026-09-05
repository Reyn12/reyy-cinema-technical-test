import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WProfileInfoAvatar extends StatelessWidget {
  const WProfileInfoAvatar({
    super.key,
    this.avatarSrc,
    this.onTapEditProfile,
  });

  final String? avatarSrc;
  final VoidCallback? onTapEditProfile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: avatarSrc != null
                ? ImageLoad(
                    src: avatarSrc,
                    isAsset: true,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    shapeImage: ShapeImage.circle,
                  )
                : Container(
                    color: AppColors.primarySurface,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 48,
                      color: AppColors.primaryPressed,
                    ),
                  ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: onTapEditProfile ??
                () {
                  CustomSnackbar.info(
                    context,
                    'Fitur Edit Profile belum tersedia',
                  );
                },
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: AppColors.primaryPressed,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Assets.icons.icEditProfile.svg(
                width: 14,
                height: 14,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
