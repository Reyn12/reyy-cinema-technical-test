import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_format_item.dart';

class WBuyTicketFormatFilter extends StatelessWidget {
  const WBuyTicketFormatFilter({
    super.key,
    required this.formats,
    required this.selectedIndex,
    required this.onFormatSelected,
  });

  final List<String> formats;
  final int selectedIndex;
  final ValueChanged<int> onFormatSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: formats.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return WBuyTicketFormatItem(
            label: formats[index],
            isSelected: index == selectedIndex,
            onTap: () => onFormatSelected(index),
          );
        },
      ),
    );
  }
}
