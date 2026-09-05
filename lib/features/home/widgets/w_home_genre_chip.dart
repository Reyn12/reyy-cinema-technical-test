import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeGenreChip extends StatelessWidget {
  const WHomeGenreChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTypography.bodyRegularS.copyWith(
          color: AppColors.textColor70,
        ),
      ),
    );
  }
}
