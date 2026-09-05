import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeDarkBadge extends StatelessWidget {
  const WHomeDarkBadge({
    super.key,
    required this.label,
    this.leading,
  });

  final String label;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 4)],
          Text(
            label,
            style: AppTypography.bodySemiboldS.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
