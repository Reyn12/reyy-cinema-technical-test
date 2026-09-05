import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_bloc.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_event.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_state.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_bottom_bar.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_cinema_list_builder.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_cinema_list_shimmer.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_date_selector.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_film_summary.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_film_summary_shimmer.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_format_filter.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_format_filter_shimmer.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_select_args.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/empty_state.dart';
import 'package:reyy_cinema/widget/state_view.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key, required this.filmId});

  final int filmId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuyTicketBloc(filmId: filmId),
      child: const BuyTicketView(),
    );
  }
}

class BuyTicketView extends StatelessWidget {
  const BuyTicketView({super.key});

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
              title: 'Beli Tiket',
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
                  final bloc = context.read<BuyTicketBloc>();
                  bloc.add(const BuyTicketLoadRequested());
                  await bloc.stream.firstWhere((state) => !state.isAnyLoading);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                  child: BlocBuilder<BuyTicketBloc, BuyTicketState>(
                    builder: (context, state) {
                      final film = state.film;

                      return Column(
                        spacing: 16,
                        children: [
                          StateView(
                            isLoading: state.isFilmLoading,
                            hasError: state.hasFilmError || film == null,
                            errorMessage: 'Gagal memuat film',
                            onRetry: () => context.read<BuyTicketBloc>().add(
                              const BuyTicketLoadRequested(),
                            ),
                            loadingView: const WBuyTicketFilmSummaryShimmer(),
                            child: film == null
                                ? const SizedBox.shrink()
                                : WBuyTicketFilmSummary(
                                    image: film.poster,
                                    ageRating: film.ageRating,
                                    rating: film.rating,
                                    duration: film.duration,
                                    title: film.title,
                                    genres: film.genres.join(', '),
                                    formats: state.filmFormats,
                                  ),
                          ),
                          WBuyTicketDateSelector(
                            monthLabel: state.monthLabel,
                            items: state.dates,
                            selectedIndex: state.selectedDateIndex,
                            onDateSelected: (index) {
                              context.read<BuyTicketBloc>().add(
                                BuyTicketDateSelected(index),
                              );
                            },
                          ),
                          StateView(
                            isLoading:
                                state.isSchedulesLoading &&
                                state.formats.isEmpty,
                            hasError: false,
                            loadingView: const WBuyTicketFormatFilterShimmer(),
                            child: WBuyTicketFormatFilter(
                              formats: state.formats,
                              selectedIndex: state.selectedFormatIndex,
                              onFormatSelected: (index) {
                                context.read<BuyTicketBloc>().add(
                                  BuyTicketFormatSelected(index),
                                );
                              },
                            ),
                          ),
                          StateView(
                            isLoading: state.isSchedulesLoading,
                            hasError: state.hasSchedulesError,
                            isEmpty: state.filteredCinemas.isEmpty,
                            errorMessage: 'Gagal memuat jadwal',
                            onRetry: () {
                              final bloc = context.read<BuyTicketBloc>();
                              bloc.add(
                                BuyTicketDateSelected(
                                  bloc.state.selectedDateIndex,
                                ),
                              );
                            },
                            loadingView: const WBuyTicketCinemaListShimmer(),
                            emptyView: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: EmptyState(
                                title: 'Jadwal kosong',
                                subtitle:
                                    'Belum ada bioskop untuk filter/tanggal ini',
                              ),
                            ),
                            child: WBuyTicketCinemaListBuilder(
                              cinemas: state.filteredCinemas,
                              selectedSlotId: state.selectedSlotId,
                              onToggleFavorite: (cinemaId) {
                                context.read<BuyTicketBloc>().add(
                                  BuyTicketFavoriteToggled(cinemaId),
                                );
                              },
                              onSlotSelected: (slot) {
                                context.read<BuyTicketBloc>().add(
                                  BuyTicketSlotSelected(slot.id),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            BlocBuilder<BuyTicketBloc, BuyTicketState>(
              builder: (context, state) {
                if (!state.hasSelectedSlot) {
                  return const SizedBox.shrink();
                }
                return WBuyTicketBottomBar(
                  cinemaStudioLabel: state.cinemaStudioLabel,
                  scheduleLabel: state.scheduleLabel,
                  estimatedPriceLabel: state.estimatedPriceLabel,
                  onPressed: () {
                    final slotId = state.selectedSlotId;
                    final studio = state.selectedStudio;
                    final filmId = context.read<BuyTicketBloc>().filmId;
                    if (slotId == null || studio == null) return;

                    context.push(
                      AppPaths.seatSelect,
                      extra: SeatSelectArgs(
                        filmId: state.film?.id ?? filmId,
                        slotId: slotId,
                        cinemaStudioLabel: state.cinemaStudioLabel,
                        dateLabel: state.dateLabel,
                        timeLabel: state.timeLabel,
                        formatLabel: studio.name,
                        ticketPrice: studio.price,
                      ),
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
