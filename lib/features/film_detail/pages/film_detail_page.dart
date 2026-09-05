import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_buy_ticket_bar.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_cast_list_builder.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_hero.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_info_row.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_status_header.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_synopsis.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class FilmDetailPage extends StatelessWidget {
  const FilmDetailPage({super.key});

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
                  await Future<void>.delayed(const Duration(milliseconds: 600));
                  if (!context.mounted) return;
                  CustomSnackbar.info(context, 'Refresh completed');
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                  child: Column(
                    spacing: 16,
                    children: [
                      WFilmDetailStatusHeader(
                        statusLabel: 'SEDANG TAYANG',
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
                        image: Assets.images.imgDumyDetailFilm,
                        ageRating: '13+',
                        rating: '4.7',
                        ratingCount: '12.4k',
                        duration: '2j 05m',
                        title: 'Black Adam',
                        genres: const ['Aksi', 'Petualangan', 'Fantasi'],
                      ),
                      WFilmDetailSynopsis(
                        text:
                            'Hampir 5.000 tahun setelah dianugerahi kekuatan maha dahsyat para dewa Mesir kuno dan dipenjarakan, Black Adam terbebas dari makamnya dan dilempar ke dunia modern. Dengan kekuatan yang hampir tak terbatas, ia harus memilih antara menjadi pahlawan atau ancaman bagi umat manusia.',
                      ),
                      WFilmDetailInfoRow(
                        director: 'Jaume Collet-Serra',
                        writer: 'Adam Sztykiel',
                        status: 'Tayang Bioskop',
                      ),
                      const WFilmDetailCastListBuilder(),
                    ],
                  ),
                ),
              ),
            ),
            WFilmDetailBuyTicketBar(
              onPressed: () {
                CustomSnackbar.info(context, 'Fitur Beli Tiket belum tersedia');
              },
            ),
          ],
        ),
      ),
    );
  }
}
