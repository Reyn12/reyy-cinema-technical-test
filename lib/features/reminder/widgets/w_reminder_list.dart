import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/reminder/bloc/reminder_cubit.dart';
import 'package:reyy_cinema/features/reminder/widgets/w_reminder_item.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WReminderList extends StatelessWidget {
  const WReminderList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select(
      (ReminderCubit cubit) => cubit.state.filteredItems,
    );

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        indent: 16,
        endIndent: 16,
        color: AppColors.neutral30,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return WReminderItem(
          item: item,
          onTap: () {
            context.read<ReminderCubit>().markAsRead(item.id);
          },
        );
      },
    );
  }
}
