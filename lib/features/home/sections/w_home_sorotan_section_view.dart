import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/bloc/home_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_event.dart';
import 'package:reyy_cinema/features/home/bloc/home_state.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_sorotan_section.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_sorotan_section_shimmer.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/state_view.dart';

class WHomeSorotanSectionView extends StatelessWidget {
  const WHomeSorotanSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) =>
          prev.isSorotanLoading != curr.isSorotanLoading ||
          prev.hasSorotanError != curr.hasSorotanError ||
          prev.sorotan != curr.sorotan,
      builder: (context, state) {
        final film = state.sorotan?.film;

        return StateView(
          isLoading: state.isSorotanLoading,
          hasError: state.hasSorotanError || film == null,
          errorMessage: 'Gagal memuat sorotan',
          onRetry: () => context.read<HomeBloc>().add(
            const HomeLoadRequested(),
          ),
          loadingView: const WHomeSorotanSectionShimmer(),
          child: film == null
              ? const SizedBox.shrink()
              : WHomeSorotanSection(
                  image: film.poster,
                  rating: film.rating,
                  ratingCount: film.ratingCount,
                  ageRating: film.ageRating,
                  cinemaLabel: film.cinemaLabel,
                  movieTitle: film.title,
                  duration: film.duration,
                  genres: film.genres,
                  onTapSeeAll: () {
                    CustomSnackbar.info(
                      context,
                      'Fitur Lihat Semua belum tersedia',
                    );
                  },
                  onTapBookTicket: () {
                    context.push(AppPaths.buyTicketWithId(film.id));
                  },
                ),
        );
      },
    );
  }
}
