import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_cinema_info_card.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_map.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_selected_cinema.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_section.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class BioskopPage extends StatelessWidget {
  const BioskopPage({super.key});

  static const cinemaName = 'XXI Solo Square';
  static const cinemaLocation = LatLng(-6.915030539127153, 107.5975680814174);

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
                            cinemaName: cinemaName,
                            onTapOpenBottomSheetCinema: () {
                              CustomSnackbar.info(
                                context,
                                'Fitur Pilih Bioskop belum tersedia',
                              );
                            },
                          ),
                          SizedBox(
                            height: 360,
                            child: WBioskopMap(
                              cinemaName: cinemaName,
                              destination: cinemaLocation,
                            ),
                          ),
                          WBioskopCinemaInfoCard(
                            cinemaName: cinemaName,
                            statusLabel: 'Buka',
                            openHours: '10.00 - 22.30',
                            distanceLabel: '1.8 km',
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
                      onTapSeeAll: () {
                        CustomSnackbar.info(
                          context,
                          'Fitur Semua Film Pilihan belum tersedia',
                        );
                      },
                      onTapLihatFilm: () {
                        CustomSnackbar.info(
                          context,
                          'Fitur Lihat Film belum tersedia',
                        );
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
