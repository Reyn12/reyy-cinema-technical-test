import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/reminder/models/film_reminder_item_model.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_item.dart';

class WReminderListBuilder extends StatelessWidget {
  const WReminderListBuilder({super.key, required this.items});

  final List<FilmReminderItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return WReminderItem(item: items[index]);
      },
    );
  }
}
