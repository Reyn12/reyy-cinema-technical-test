import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WBioskopSelectedCinema extends StatelessWidget {
  const WBioskopSelectedCinema({
    super.key,
    required this.cinemaName,
    required this.onTapOpenBottomSheetCinema,
  });

  final String cinemaName;
  final VoidCallback onTapOpenBottomSheetCinema;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapOpenBottomSheetCinema,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: AppShadows.soft,
        ),
        child: Row(
          children: [
            ImageLoad(
              src: Assets.icons.icSelectBioskop.path,
              isAsset: true,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pilih Bioskop',
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.textColor50,
                    ),
                  ),
                  Text(
                    cinemaName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySemiboldM.copyWith(
                      color: AppColors.primaryPressed,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Assets.icons.icDown.svg(
              width: 10,
              height: 6,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryPressed,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
