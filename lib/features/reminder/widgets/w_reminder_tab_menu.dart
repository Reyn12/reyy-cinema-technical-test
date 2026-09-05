import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/reminder/bloc/reminder_bloc.dart';
import 'package:reyy_cinema/features/reminder/bloc/reminder_event.dart';
import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WReminderTabMenu extends StatelessWidget {
  const WReminderTabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (ReminderBloc bloc) => bloc.state.selectedTab,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: ReminderTab.values.map((tab) {
          final isActive = tab == selectedTab;

          return Expanded(
            child: GestureDetector(
              onTap: () =>
                  context.read<ReminderBloc>().add(ReminderTabChanged(tab)),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.neutral10 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: isActive
                      ? null
                      : Border.all(color: AppColors.textColor10),
                  boxShadow: isActive ? AppShadows.soft : null,
                ),
                child: Text(
                  tab.label,
                  textAlign: TextAlign.center,
                  style: AppTypography.h11Medium.copyWith(
                    color: isActive
                        ? AppColors.primaryPressed
                        : AppColors.textColor60,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
