import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_bloc.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_event.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_state.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_bottom_bar.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_film_summary.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_map.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_summary.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class SeatSelectPage extends StatelessWidget {
  const SeatSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeatSelectBloc(),
      child: const SeatSelectView(),
    );
  }
}

class SeatSelectView extends StatelessWidget {
  const SeatSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            AppHeader(
              title: 'Pilih Kursi',
              leading: canPop
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    )
                  : null,
            ),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryPressed,
                onRefresh: () async {
                  await Future<void>.delayed(const Duration(milliseconds: 600));
                  if (!context.mounted) return;
                  CustomSnackbar.info(context, 'Refresh completed');
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: BlocBuilder<SeatSelectBloc, SeatSelectState>(
                    builder: (context, state) {
                      return Column(
                        spacing: 16,
                        children: [
                          WSeatSelectFilmSummary(
                            image: Assets.images.imgDumyDetailFilm,
                            ageRating: 'D-17',
                            format: 'Reguler 2D',
                            rating: '4.2',
                            title: 'Black Adam',
                            cinemaLabel: 'XXI Solo Square • Studio 1',
                            dateLabel: 'Rabu, 14 Okt 2026',
                            timeLabel: '18:30 WIB',
                          ),
                          WSeatSelectMap(
                            rows: state.rows,
                            selectedSeatIds: state.selectedSeatIds,
                            onSeatSelected: (seatId) {
                              context.read<SeatSelectBloc>().add(
                                SeatSelectToggled(seatId),
                              );
                            },
                          ),
                          WSeatSelectSummary(
                            selectedSeatsLabel: state.selectedSeatsLabel,
                            ticketCountLabel: state.ticketCountLabel,
                            ticketsPriceDetailLabel:
                                state.ticketsPriceDetailLabel,
                            ticketsSubtotalLabel: state.ticketsSubtotalLabel,
                            serviceFeeLabel: state.serviceFeeLabel,
                            isReminderEnabled: state.isReminderEnabled,
                            onReminderChanged: (enabled) {
                              context.read<SeatSelectBloc>().add(
                                SeatSelectReminderToggled(enabled),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            BlocBuilder<SeatSelectBloc, SeatSelectState>(
              builder: (context, state) {
                return WSeatSelectBottomBar(
                  totalPaymentLabel: state.totalPaymentLabel,
                  enabled: state.hasSelectedSeats,
                  onPressed: () {
                    CustomSnackbar.info(
                      context,
                      'Fitur Pembayaran belum tersedia',
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
