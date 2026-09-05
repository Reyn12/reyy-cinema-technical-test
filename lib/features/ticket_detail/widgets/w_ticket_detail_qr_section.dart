import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WTicketDetailQrSection extends StatelessWidget {
  const WTicketDetailQrSection({
    super.key,
    required this.qrImage,
    required this.studioLabel,
  });

  final AssetGenImage qrImage;
  final String studioLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppShadows.smooth,
          ),
          child: ImageLoad(
            src: qrImage.path,
            isAsset: true,
            width: 160,
            height: 160,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          'Scan langsung di pintu masuk $studioLabel',
          textAlign: TextAlign.center,
          style: AppTypography.bodyRegularS.copyWith(
            color: AppColors.textColor50,
          ),
        ),
      ],
    );
  }
}
