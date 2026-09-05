import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WProfileStatItem extends StatelessWidget {
  const WProfileStatItem({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: AppTypography.h9Bold.copyWith(
                color: AppColors.primaryPressed,
              ),
            ),
            const SizedBox(width: 4),
            icon,
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTypography.bodyRegularS.copyWith(
            color: AppColors.textColor50,
          ),
        ),
      ],
    );
  }
}
