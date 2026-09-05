import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmDetailSynopsis extends StatefulWidget {
  const WFilmDetailSynopsis({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<WFilmDetailSynopsis> createState() => _WFilmDetailSynopsisState();
}

class _WFilmDetailSynopsisState extends State<WFilmDetailSynopsis> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Sinopsis',
                  style: AppTypography.h9Bold.copyWith(
                    color: AppColors.overlayNavy,
                  ),
                ),
              ),
              Assets.icons.icSinopsis.svg(width: 19, height: 17),
            ],
          ),
          Text(
            widget.text,
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: AppTypography.bodyRegularM.copyWith(
              color: AppColors.textColor50,
            ),
          ),
          GestureDetector(
            onTap: toggleExpanded,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isExpanded ? 'Sembunyikan' : 'Baca Selengkapnya',
                  style: AppTypography.bodySemiboldS.copyWith(
                    color: AppColors.primaryDeep,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: AppColors.primaryDeep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
