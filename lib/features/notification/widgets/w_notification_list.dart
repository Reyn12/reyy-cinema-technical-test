import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/notification/bloc/notification_cubit.dart';
import 'package:reyy_cinema/features/notification/widgets/w_notification_item.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WNotificationList extends StatelessWidget {
  const WNotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select(
      (NotificationCubit cubit) => cubit.state.filteredItems,
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
        return WNotificationItem(
          item: item,
          onTap: () {
            context.read<NotificationCubit>().markAsRead(item.id);
          },
        );
      },
    );
  }
}
