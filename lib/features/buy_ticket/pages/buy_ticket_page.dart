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
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_select_args.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/empty_state.dart';

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
                      return Column(
                        spacing: 16,
                        children: [
                          if (state.isFilmLoading)
                            const WBuyTicketFilmSummaryShimmer()
                          else if (state.hasFilmError || state.film == null)
                            WHomeSectionRetry(
                              message: 'Gagal memuat film',
                              onRetry: () => context.read<BuyTicketBloc>().add(
                                const BuyTicketLoadRequested(),
                              ),
                            )
                          else
                            WBuyTicketFilmSummary(
                              image: state.film!.poster,
                              ageRating: state.film!.ageRating,
                              rating: state.film!.rating,
                              duration: state.film!.duration,
                              title: state.film!.title,
                              genres: state.film!.genres.join(', '),
                              formats: state.filmFormats,
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
                          if (state.isSchedulesLoading && state.formats.isEmpty)
                            const WBuyTicketFormatFilterShimmer()
                          else
                            WBuyTicketFormatFilter(
                              formats: state.formats,
                              selectedIndex: state.selectedFormatIndex,
                              onFormatSelected: (index) {
                                context.read<BuyTicketBloc>().add(
                                  BuyTicketFormatSelected(index),
                                );
                              },
                            ),
                          if (state.isSchedulesLoading)
                            const WBuyTicketCinemaListShimmer()
                          else if (state.hasSchedulesError)
                            WHomeSectionRetry(
                              message: 'Gagal memuat jadwal',
                              onRetry: () {
                                final bloc = context.read<BuyTicketBloc>();
                                bloc.add(
                                  BuyTicketDateSelected(
                                    bloc.state.selectedDateIndex,
                                  ),
                                );
                              },
                            )
                          else if (state.filteredCinemas.isEmpty)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: EmptyState(
                                title: 'Jadwal kosong',
                                subtitle:
                                    'Belum ada bioskop untuk filter/tanggal ini',
                              ),
                            )
                          else
                            WBuyTicketCinemaListBuilder(
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
