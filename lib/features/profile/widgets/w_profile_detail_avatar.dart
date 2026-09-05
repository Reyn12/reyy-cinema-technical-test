import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WProfileDetailAvatar extends StatelessWidget {
  const WProfileDetailAvatar({
    super.key,
    required this.enabled,
    required this.onTap,
    this.imageSrc,
  });

  final bool enabled;
  final VoidCallback onTap;
  final String? imageSrc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
          child: imageSrc != null
              ? ImageLoad(
                  src: imageSrc,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                  shapeImage: ShapeImage.circle,
                )
              : Container(
                  width: 96,
                  height: 96,
                  color: AppColors.primarySurface,
                  child: const Icon(
                    Icons.person_rounded,
                    size: 48,
                    color: AppColors.primaryPressed,
                  ),
                ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: enabled ? onTap : null,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.neutral10,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.neutral30),
                boxShadow: AppShadows.smooth,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 16,
                color: enabled ? AppColors.neutral100 : AppColors.neutral60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
