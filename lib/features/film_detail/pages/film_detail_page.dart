import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/film_detail/bloc/film_detail_bloc.dart';
import 'package:reyy_cinema/features/film_detail/bloc/film_detail_event.dart';
import 'package:reyy_cinema/features/film_detail/bloc/film_detail_state.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_buy_ticket_bar.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_cast_list_builder.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_content_shimmer.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_hero.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_info_row.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_status_header.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_synopsis.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class FilmDetailPage extends StatelessWidget {
  const FilmDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilmDetailBloc(filmId: id),
      child: const FilmDetailView(),
    );
  }
}

class FilmDetailView extends StatefulWidget {
  const FilmDetailView({super.key});

  @override
  State<FilmDetailView> createState() => _FilmDetailViewState();
}

class _FilmDetailViewState extends State<FilmDetailView> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
              title: 'Detail Film',
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
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(0);
                  }
                  context.read<FilmDetailBloc>().add(
                    const FilmDetailLoadRequested(),
                  );
                  await context.read<FilmDetailBloc>().stream.firstWhere(
                    (state) => !state.isLoading,
                  );
                },
                child: BlocBuilder<FilmDetailBloc, FilmDetailState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: WFilmDetailContentShimmer(),
                      );
                    }

                    if (state.hasError || state.film == null) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 48),
                          child: WHomeSectionRetry(
                            message: 'Gagal memuat detail film',
                            onRetry: () => context.read<FilmDetailBloc>().add(
                              const FilmDetailLoadRequested(),
                            ),
                          ),
                        ),
                      );
                    }

                    final film = state.film!;

                    return SingleChildScrollView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: ClampingScrollPhysics(),
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                      child: Column(
                        spacing: 16,
                        children: [
                          WFilmDetailStatusHeader(
                            statusLabel: state.statusLabel,
                            onTapBookmark: () {
                              CustomSnackbar.info(
                                context,
                                'Fitur Bookmark belum tersedia',
                              );
                            },
                            onTapShare: () {
                              CustomSnackbar.info(
                                context,
                                'Fitur Share belum tersedia',
                              );
                            },
                          ),
                          WFilmDetailHero(
                            image: film.poster,
                            ageRating: film.ageRating,
                            rating: film.rating,
                            ratingCount: film.ratingCount,
                            duration: film.duration,
                            title: film.title,
                            genres: film.genres,
                          ),
                          WFilmDetailSynopsis(text: film.openingCrawl),
                          WFilmDetailInfoRow(
                            director: film.director,
                            writer: state.writer,
                            status: state.cinemaStatus,
                          ),
                          WFilmDetailCastListBuilder(items: state.casts),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            WFilmDetailBuyTicketBar(
              onPressed: () => context.push(AppPaths.buyTicket),
            ),
          ],
        ),
      ),
    );
  }
}
