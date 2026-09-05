import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_bloc.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_event.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_state.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_select_args.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_bottom_bar.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_film_summary.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_film_summary_shimmer.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_map.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_map_shimmer.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_summary.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/state_view.dart';

class SeatSelectPage extends StatelessWidget {
  const SeatSelectPage({super.key, this.args = SeatSelectArgs.fallback});

  final SeatSelectArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeatSelectBloc(args: args),
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
                  final bloc = context.read<SeatSelectBloc>();
                  bloc.add(const SeatSelectLoadRequested());
                  await bloc.stream.firstWhere((state) => !state.isAnyLoading);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: BlocBuilder<SeatSelectBloc, SeatSelectState>(
                    builder: (context, state) {
                      final film = state.film;

                      return Column(
                        spacing: 16,
                        children: [
                          StateView(
                            isLoading: state.isFilmLoading,
                            hasError: state.hasFilmError || film == null,
                            errorMessage: 'Gagal memuat film',
                            onRetry: () => context.read<SeatSelectBloc>().add(
                              const SeatSelectLoadRequested(),
                            ),
                            loadingView: const WSeatSelectFilmSummaryShimmer(),
                            child: film == null
                                ? const SizedBox.shrink()
                                : WSeatSelectFilmSummary(
                                    image: film.poster,
                                    ageRating: film.ageRating,
                                    format: state.formatLabel,
                                    rating: film.rating,
                                    title: film.title,
                                    cinemaLabel: state.cinemaStudioLabel,
                                    dateLabel: state.dateLabel,
                                    timeLabel: state.timeLabel,
                                  ),
                          ),
                          StateView(
                            isLoading: state.isSeatsLoading,
                            hasError: state.hasSeatsError,
                            errorMessage: 'Gagal memuat denah kursi',
                            onRetry: () => context.read<SeatSelectBloc>().add(
                              const SeatSelectLoadRequested(),
                            ),
                            loadingView: const WSeatSelectMapShimmer(),
                            child: Column(
                              spacing: 16,
                              children: [
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
                                  ticketsSubtotalLabel:
                                      state.ticketsSubtotalLabel,
                                  serviceFeeLabel: state.serviceFeeLabel,
                                  isReminderEnabled: state.isReminderEnabled,
                                  onReminderChanged: (enabled) {
                                    context.read<SeatSelectBloc>().add(
                                      SeatSelectReminderToggled(enabled),
                                    );
                                  },
                                ),
                              ],
                            ),
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
