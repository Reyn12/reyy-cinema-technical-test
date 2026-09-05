import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class AboutAppBrandHeader extends StatelessWidget {
  const AboutAppBrandHeader({
    super.key,
    required this.appName,
    required this.version,
  });

  final String appName;
  final String version;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageLoad(
          src: Assets.icons.icLogoApp.path,
          isAsset: true,
          width: 120,
          height: 120,
          fit: BoxFit.contain,
        ),
        Text(
          appName,
          style: AppTypography.h8Bold.copyWith(color: AppColors.neutral100),
        ),
        Text(
          'Version $version',
          style: AppTypography.bodyRegularM.copyWith(
            color: AppColors.neutral70,
          ),
        ),
      ],
    );
  }
}
