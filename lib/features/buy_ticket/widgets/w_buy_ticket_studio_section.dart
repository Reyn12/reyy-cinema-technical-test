import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_time_slot.dart';
import 'package:reyy_cinema/helper/format_currency_helper.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBuyTicketStudioSection extends StatelessWidget {
  const WBuyTicketStudioSection({
    super.key,
    required this.studio,
    required this.selectedSlotId,
    required this.onSlotSelected,
  });

  final BuyTicketStudioModel studio;
  final String? selectedSlotId;
  final ValueChanged<BuyTicketTimeSlotModel> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        studio.name,
                        style: AppTypography.bodySemiboldM.copyWith(
                          color: AppColors.overlayNavy,
                        ),
                      ),
                    ),
                    if (studio.badge != null) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: studio.badgeType == BuyTicketBadgeType.ultimate
                              ? AppColors.overlayNavy
                              : AppColors.warningSurface,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          studio.badge!,
                          style: AppTypography.bodySemiboldXs.copyWith(
                            color:
                                studio.badgeType == BuyTicketBadgeType.ultimate
                                ? AppColors.white
                                : AppColors.orangeMain,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Text(
                formatRupiah(studio.price),
                style: AppTypography.bodySemiboldM.copyWith(
                  color: AppColors.primaryDeep,
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final slot in studio.slots)
                WBuyTicketTimeSlot(
                  slot: slot,
                  isSelected: selectedSlotId == slot.id,
                  onTap: () => onSlotSelected(slot),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
