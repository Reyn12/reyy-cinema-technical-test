import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.neutral10,
        boxShadow: AppShadows.smooth,
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              ?leading,
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTypography.h9Medium.copyWith(
                    color: AppColors.neutral100,
                  ),
                ),
              ),
              if (actions != null)
                ...actions!
              else if (leading != null)
                const SizedBox(width: 40),
            ],
          ),
        ),
      ),
    );
  }
}
