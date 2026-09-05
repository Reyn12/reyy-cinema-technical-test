import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_cinema_item.dart';

class WBuyTicketCinemaListBuilder extends StatelessWidget {
  const WBuyTicketCinemaListBuilder({
    super.key,
    required this.cinemas,
    required this.selectedSlotId,
    required this.onToggleFavorite,
    required this.onSlotSelected,
  });

  final List<BuyTicketCinemaModel> cinemas;
  final String? selectedSlotId;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<BuyTicketTimeSlotModel> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 12,
        children: [
          for (final cinema in cinemas)
            WBuyTicketCinemaItem(
              cinema: cinema,
              selectedSlotId: selectedSlotId,
              onToggleFavorite: () => onToggleFavorite(cinema.id),
              onSlotSelected: onSlotSelected,
            ),
        ],
      ),
    );
  }
}
