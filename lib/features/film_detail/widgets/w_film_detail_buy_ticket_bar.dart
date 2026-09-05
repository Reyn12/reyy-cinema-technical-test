import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WFilmDetailBuyTicketBar extends StatelessWidget {
  const WFilmDetailBuyTicketBar({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.smooth,
      ),
      child: SafeArea(
        top: false,
        child: PrimaryButton.withIcon(
          text: 'Beli Tiket',
          color: AppColors.primary,
          textColor: AppColors.white,
          leading: Assets.icons.icBuyTicket.svg(
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
