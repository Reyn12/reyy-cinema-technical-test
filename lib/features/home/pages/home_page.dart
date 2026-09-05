import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_background_header.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_banner_carousel.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_greetings.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_header.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_section.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_promo_card.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_sorotan_section.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            WHomeHeader(
              isNotificationActive: true,
              onTapDetailNotification: () {
                context.push(AppPaths.reminder);
              },
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
                  child: Column(
                    spacing: 24,
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  WHomeBackgroundHeader(),
                                  WHomeGreetings(userName: 'Renaldi (Reyy)'),
                                ],
                              ),
                              const SizedBox(height: 120),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: WHomePromoCard(
                              title: 'Diskon Hingga 50%',
                              description:
                                  'Dapatkan promo menarik setiap Senin di bioskop XXI pilihanmu.',
                              buttonText: 'Klaim Promo',
                              onTapClaimPromo: () {
                                CustomSnackbar.info(
                                  context,
                                  'Fitur Klaim Promo belum tersedia',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      WHomeBannerCarousel(
                        banners: [
                          Assets.images.imgDummyBanner1,
                          Assets.images.imgDummyBanner2,
                          Assets.images.imgDummyBanner3,
                        ],
                        onTapDetailBanner: (_) {
                          CustomSnackbar.info(
                            context,
                            'Fitur Detail Banner belum tersedia',
                          );
                        },
                      ),
                      WHomeSorotanSection(
                        image: Assets.images.imgDummySorotanBanner1,
                        rating: '4.8',
                        ratingCount: '12.4k',
                        ageRating: 'D 17+',
                        cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
                        movieTitle: 'Black Adam: Sovereign',
                        duration: '2j 05m',
                        genres: const [
                          'Action',
                          'Petualangan',
                          'Sci-Fi',
                          'Drama',
                          'Thriller',
                          'Fantasi',
                          'Komedi',
                        ],
                        onTapSeeAll: () {
                          CustomSnackbar.info(
                            context,
                            'Fitur Lihat Semua belum tersedia',
                          );
                        },
                        onTapBookTicket: () {
                          CustomSnackbar.info(
                            context,
                            'Fitur Pesan Tiket belum tersedia',
                          );
                        },
                      ),
                      WFilmPilihanSection(
                        onTapSeeAll: () {
                          CustomSnackbar.info(
                            context,
                            'Fitur Semua Film Pilihan belum tersedia',
                          );
                        },
                        onTapLihatFilm: () {
                          context.push(AppPaths.filmDetail);
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
