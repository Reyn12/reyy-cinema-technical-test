import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class TermsScrollDownButton extends StatelessWidget {
  const TermsScrollDownButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.shadesPrimary60,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              'Scroll Kebawah',
              style: AppTypography.bodySemiboldM.copyWith(
                color: AppColors.neutral10,
              ),
            ),
            const Icon(
              Icons.arrow_downward,
              size: 18,
              color: AppColors.neutral10,
            ),
          ],
        ),
      ),
    );
  }
}
