import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_studio_section.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBuyTicketCinemaItem extends StatelessWidget {
  const WBuyTicketCinemaItem({
    super.key,
    required this.cinema,
    required this.selectedSlotId,
    required this.onToggleFavorite,
    required this.onSlotSelected,
  });

  final BuyTicketCinemaModel cinema;
  final String? selectedSlotId;
  final VoidCallback onToggleFavorite;
  final ValueChanged<BuyTicketTimeSlotModel> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            cinema.name,
                            style: AppTypography.h10Bold.copyWith(
                              color: AppColors.overlayNavy,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: AppColors.textColor50,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${cinema.distanceLabel} • ${cinema.address}',
                            style: AppTypography.bodyRegularS.copyWith(
                              color: AppColors.textColor50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onToggleFavorite,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.primarySurface,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    cinema.isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    size: 18,
                    color: cinema.isFavorite
                        ? AppColors.error
                        : AppColors.textColor50,
                  ),
                ),
              ),
            ],
          ),
          for (final studio in cinema.studios)
            WBuyTicketStudioSection(
              studio: studio,
              selectedSlotId: selectedSlotId,
              onSlotSelected: onSlotSelected,
            ),
        ],
      ),
    );
  }
}
