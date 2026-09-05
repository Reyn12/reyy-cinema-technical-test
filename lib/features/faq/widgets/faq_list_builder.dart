import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/faq/models/faq_model.dart';
import 'package:reyy_cinema/features/faq/widgets/faq_item_card.dart';

class FaqListBuilder extends StatelessWidget {
  const FaqListBuilder({
    super.key,
    required this.items,
  });

  final List<FaqItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 16,
        children: [
          for (var i = 0; i < items.length; i++)
            FaqItemCard(
              item: items[i],
              initiallyExpanded: i == 0,
            ),
        ],
      ),
    );
  }
}
