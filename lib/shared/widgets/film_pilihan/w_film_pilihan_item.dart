import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WFilmPilihanItem extends StatefulWidget {
  const WFilmPilihanItem({
    super.key,
    required this.image,
    required this.title,
    required this.genres,
    required this.duration,
    required this.rating,
    required this.onTapLihatFilm,
    this.isFavorite = false,
    this.onTapFavorite,
  });

  final AssetGenImage image;
  final String title;
  final String genres;
  final String duration;
  final String rating;
  final VoidCallback onTapLihatFilm;
  final bool isFavorite;
  final ValueChanged<bool>? onTapFavorite;

  @override
  State<WFilmPilihanItem> createState() => _WFilmPilihanItemState();
}

class _WFilmPilihanItemState extends State<WFilmPilihanItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() => isFavorite = !isFavorite);
    widget.onTapFavorite?.call(isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageLoad(
                  src: widget.image.path,
                  isAsset: true,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: toggleFavorite,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 18,
                        color: isFavorite
                            ? AppColors.error
                            : AppColors.neutral100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.icStar.svg(width: 13, height: 12),
                        const SizedBox(width: 4),
                        Text(
                          widget.rating,
                          style: AppTypography.bodySemiboldS.copyWith(
                            color: AppColors.neutral100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.h10Bold.copyWith(
                    color: AppColors.primaryPressed,
                  ),
                ),
                Text(
                  widget.genres,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodyRegularS.copyWith(
                    color: AppColors.textColor50,
                  ),
                ),
                Row(
                  children: [
                    Assets.icons.icClock.svg(
                      width: 12,
                      height: 12,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textColor50,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.duration,
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                PrimaryButton(
                  text: 'Lihat Film',
                  height: 40,
                  color: AppColors.primarySurface,
                  textColor: AppColors.primaryPressed,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  onPressed: widget.onTapLihatFilm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
