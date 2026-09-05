import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_bloc.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_event.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_state.dart';
import 'package:reyy_cinema/features/home/widgets/w_film_pilihan_section_shimmer.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_section.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class WBioskopFilmsSection extends StatelessWidget {
  const WBioskopFilmsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioskopBloc, BioskopState>(
      buildWhen: (prev, curr) =>
          prev.isFilmsLoading != curr.isFilmsLoading ||
          prev.hasFilmsError != curr.hasFilmsError ||
          prev.films != curr.films ||
          prev.filmCategories != curr.filmCategories ||
          prev.selectedFilmCategoryIndex != curr.selectedFilmCategoryIndex,
      builder: (context, state) {
        if (state.isInitialFilmsLoading) {
          return const WFilmPilihanSectionShimmer();
        }

        if (state.hasFilmsError && state.filmCategories.isEmpty) {
          return WHomeSectionRetry(
            message: 'Gagal memuat film',
            onRetry: () => context.read<BioskopBloc>().add(
              const BioskopLoadRequested(),
            ),
          );
        }

        return WFilmPilihanSection(
          title: 'Film di Bioskop Ini',
          categories: state.filmCategories,
          films: state.filmPilihanItems,
          selectedCategoryIndex: state.selectedFilmCategoryIndex,
          isFilmsLoading: state.isFilmsLoading,
          onCategorySelected: (index) {
            context.read<BioskopBloc>().add(BioskopFilmCategoryChanged(index));
          },
          onTapSeeAll: () {
            CustomSnackbar.info(
              context,
              'Fitur Semua Film di Bioskop belum tersedia',
            );
          },
          onTapLihatFilm: (film) {
            context.push(AppPaths.filmDetailWithId(film.id));
          },
        );
      },
    );
  }
}
