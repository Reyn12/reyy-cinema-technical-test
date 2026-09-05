import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_event.dart';
import 'package:reyy_cinema/features/home/bloc/home_state.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_background_header.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_greetings.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_promo_card.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_promo_card_shimmer.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class WHomeHeroSection extends StatelessWidget {
  const WHomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) =>
          prev.userName != curr.userName ||
          prev.isPromoLoading != curr.isPromoLoading ||
          prev.hasPromoError != curr.hasPromoError ||
          prev.promo != curr.promo,
      builder: (context, state) {
        final promo = state.promo;

        return Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    const WHomeBackgroundHeader(),
                    WHomeGreetings(
                      userName: state.userName.isEmpty
                          ? 'Guest'
                          : state.userName,
                    ),
                  ],
                ),
                const SizedBox(height: 120),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: state.isPromoLoading
                  ? const WHomePromoCardShimmer()
                  : state.hasPromoError || promo == null
                  ? WHomeSectionRetry(
                      message: 'Gagal memuat promo',
                      onRetry: () => context.read<HomeBloc>().add(
                        const HomeLoadRequested(),
                      ),
                    )
                  : WHomePromoCard(
                      title: promo.title,
                      description: promo.description,
                      buttonText: promo.buttonText,
                      onTapClaimPromo: () {
                        CustomSnackbar.info(
                          context,
                          'Fitur Klaim Promo belum tersedia',
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
