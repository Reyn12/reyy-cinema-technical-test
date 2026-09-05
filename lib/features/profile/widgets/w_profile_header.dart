import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WProfileHeader extends StatelessWidget {
  const WProfileHeader({super.key, this.title = 'Profile'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: SizedBox(
            width: double.infinity,
            child: ImageLoad(
              src: Assets.images.imgBgProfileUpper.path,
              isAsset: true,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: -5,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: Center(
              child: Text(
                title,
                style: AppTypography.h9Medium.copyWith(
                  color: AppColors.neutral10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
