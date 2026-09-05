import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/bioskop/models/cinema_model.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_cinema_info_card.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_map.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_select_cinema_bottom_sheet.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_selected_cinema.dart';
import 'package:reyy_cinema/features/home/mappers/film_mapper.dart';
import 'package:reyy_cinema/features/home/mocks/home_mocks.dart';
import 'package:reyy_cinema/network/api_service.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_section.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/bottom_sheet_helper.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class BioskopPage extends StatefulWidget {
  const BioskopPage({super.key});

  @override
  State<BioskopPage> createState() => _BioskopPageState();
}

class _BioskopPageState extends State<BioskopPage> {
  CinemaModel selectedCinema = WBioskopSelectCinemaBottomSheet.cinemas.first;

  int selectedFilmCategoryIndex = 0;
  bool isFilmsLoading = false;
  List<FilmPilihanItemModel> films = HomeMocks.films.toFilmPilihanItems();

  Future<void> openSelectCinemaBottomSheet() async {
    final result = await BottomSheetHelper.showBar<CinemaModel>(
      context,
      builder: (_) => WBioskopSelectCinemaBottomSheet(
        selectedCinemaName: selectedCinema.name,
      ),
    );

    if (result == null || !mounted) return;
    setState(() => selectedCinema = result);
  }

  Future<void> onFilmCategorySelected(int index) async {
    if (index == selectedFilmCategoryIndex && !isFilmsLoading) return;

    final categories = HomeMocks.filmCategories;
    final categoryId = categories[index.clamp(0, categories.length - 1)].id;

    setState(() {
      selectedFilmCategoryIndex = index;
      isFilmsLoading = true;
    });

    try {
      final result = await sharedApiService.fetchFilms(
        mock: true,
        categoryId: categoryId,
      );
      if (!mounted) return;
      setState(() {
        films = result.toFilmPilihanItems();
        isFilmsLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => isFilmsLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const AppHeader(title: 'Bioskop'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        spacing: 16,
                        children: [
                          WBioskopSelectedCinema(
                            cinemaName: selectedCinema.name,
                            onTapOpenBottomSheetCinema:
                                openSelectCinemaBottomSheet,
                          ),
                          SizedBox(
                            height: 360,
                            child: WBioskopMap(
                              key: ValueKey(selectedCinema.name),
                              cinemaName: selectedCinema.name,
                              destination: selectedCinema.location,
                            ),
                          ),
                          WBioskopCinemaInfoCard(
                            cinemaName: selectedCinema.name,
                            statusLabel: 'Buka',
                            openHours: '10.00 - 22.30',
                            distanceLabel: selectedCinema.distanceLabel,
                            durationLabel: '12 menit berkendara',
                            onTapBookmark: () {
                              CustomSnackbar.info(
                                context,
                                'Fitur Bookmark Bioskop belum tersedia',
                              );
                            },
                            onTapStartNavigation: () {
                              CustomSnackbar.info(
                                context,
                                'Fitur Mulai Navigasi belum tersedia',
                              );
                            },
                            onTapSeeSchedule: () {
                              CustomSnackbar.info(
                                context,
                                'Fitur Lihat Jadwal belum tersedia',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    WFilmPilihanSection(
                      title: 'Film di Bioskop Ini',
                      categories: HomeMocks.filmCategories,
                      films: films,
                      selectedCategoryIndex: selectedFilmCategoryIndex,
                      isFilmsLoading: isFilmsLoading,
                      onCategorySelected: onFilmCategorySelected,
                      onTapSeeAll: () {
                        CustomSnackbar.info(
                          context,
                          'Fitur Semua Film di Bioskop belum tersedia',
                        );
                      },
                      onTapLihatFilm: (film) {
                        context.push(AppPaths.filmDetailWithId(film.id));
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
