import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/bloc/home_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_event.dart';
import 'package:reyy_cinema/features/home/bloc/home_state.dart';
import 'package:reyy_cinema/features/home/widgets/w_film_pilihan_section_shimmer.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_section.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class WHomeFilmsSection extends StatelessWidget {
  const WHomeFilmsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) =>
          prev.isFilmsLoading != curr.isFilmsLoading ||
          prev.hasFilmsError != curr.hasFilmsError ||
          prev.films != curr.films ||
          prev.filmCategories != curr.filmCategories,
      builder: (context, state) {
        if (state.isFilmsLoading) {
          return const WFilmPilihanSectionShimmer();
        }

        if (state.hasFilmsError) {
          return WHomeSectionRetry(
            message: 'Gagal memuat film',
            onRetry: () => context.read<HomeBloc>().add(
              const HomeLoadRequested(),
            ),
          );
        }

        return WFilmPilihanSection(
          categories: state.filmCategories,
          films: state.filmPilihanItems,
          onTapSeeAll: () {
            CustomSnackbar.info(
              context,
              'Fitur Semua Film Pilihan belum tersedia',
            );
          },
          onTapLihatFilm: (_) {
            context.push(AppPaths.filmDetail);
          },
        );
      },
    );
  }
}
