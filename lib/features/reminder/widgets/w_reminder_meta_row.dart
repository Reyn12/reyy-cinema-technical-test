import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WReminderMetaRow extends StatelessWidget {
  const WReminderMetaRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  final IconData icon;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: iconColor),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.textColor50,
            ),
          ),
        ),
      ],
    );
  }
}
