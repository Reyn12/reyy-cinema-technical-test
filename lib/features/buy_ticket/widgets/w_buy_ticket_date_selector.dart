import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_date_item.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBuyTicketDateSelector extends StatelessWidget {
  const WBuyTicketDateSelector({
    super.key,
    required this.monthLabel,
    required this.items,
    required this.selectedIndex,
    required this.onDateSelected,
  });

  final String monthLabel;
  final List<BuyTicketDateModel> items;
  final int selectedIndex;
  final ValueChanged<int> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Pilih Tanggal',
                  style: AppTypography.h9Bold.copyWith(
                    color: AppColors.overlayNavy,
                  ),
                ),
              ),
              Text(
                monthLabel,
                style: AppTypography.bodySemiboldS.copyWith(
                  color: AppColors.primaryDeep,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return WBuyTicketDateItem(
                item: items[index],
                isSelected: index == selectedIndex,
                onTap: () => onDateSelected(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
