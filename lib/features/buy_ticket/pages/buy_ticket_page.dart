import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_bloc.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_event.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_state.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_bottom_bar.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_cinema_list_builder.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_date_selector.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_film_summary.dart';
import 'package:reyy_cinema/features/buy_ticket/widgets/w_buy_ticket_format_filter.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuyTicketBloc(),
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
                  await Future<void>.delayed(const Duration(milliseconds: 600));
                  if (!context.mounted) return;
                  CustomSnackbar.info(context, 'Refresh completed');
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
                          WBuyTicketFilmSummary(
                            image: Assets.images.imgDumyDetailFilm,
                            ageRating: '13+',
                            rating: '4.7',
                            duration: '2j 05m',
                            title: 'Black Adam',
                            genres: 'Aksi, Petualangan, Fantasi',
                            formats: const ['Dolby Atmos', 'IMAX 2D'],
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
                          WBuyTicketFormatFilter(
                            formats: state.formats,
                            selectedIndex: state.selectedFormatIndex,
                            onFormatSelected: (index) {
                              context.read<BuyTicketBloc>().add(
                                BuyTicketFormatSelected(index),
                              );
                            },
                          ),
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
                  onPressed: () => context.push(AppPaths.seatSelect),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
