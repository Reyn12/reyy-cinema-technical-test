import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class TicketDetailPolicyItem {
  const TicketDetailPolicyItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class WTicketDetailPolicy extends StatelessWidget {
  const WTicketDetailPolicy({
    super.key,
    required this.items,
  });

  final List<TicketDetailPolicyItem> items;

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
        spacing: 14,
        children: [
          Text(
            'Petunjuk & Kebijakan Bioskop',
            style: AppTypography.h9Bold.copyWith(
              color: AppColors.overlayNavy,
            ),
          ),
          for (final item in items)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.primarySurfaceAlt,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    size: 18,
                    color: AppColors.overlayNavy,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        item.title,
                        style: AppTypography.bodySemiboldM.copyWith(
                          color: AppColors.overlayNavy,
                        ),
                      ),
                      Text(
                        item.description,
                        style: AppTypography.bodyRegularS.copyWith(
                          color: AppColors.textColor50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
