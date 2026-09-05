import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WSeatSelectLegend extends StatelessWidget {
  const WSeatSelectLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primarySurfaceAlt,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _LegendItem(
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.primarySurface),
              ),
            ),
            label: 'Tersedia',
          ),
          _LegendItem(
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primarySurfaceAlt,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.close_rounded,
                size: 12,
                color: AppColors.textColor50,
              ),
            ),
            label: 'Terisi',
          ),
          _LegendItem(
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 12,
                color: AppColors.white,
              ),
            ),
            label: 'Dipilih',
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.child,
    required this.label,
    this.isBold = false,
  });

  final Widget child;
  final String label;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        const SizedBox(width: 6),
        Text(
          label,
          style: (isBold
                  ? AppTypography.bodySemiboldS
                  : AppTypography.bodyRegularS)
              .copyWith(color: AppColors.overlayNavy),
        ),
      ],
    );
  }
}
