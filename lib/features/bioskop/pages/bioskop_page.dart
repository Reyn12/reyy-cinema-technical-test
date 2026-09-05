import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_selected_cinema.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class BioskopPage extends StatelessWidget {
  const BioskopPage({super.key});

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
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  WBioskopSelectedCinema(
                    cinemaName: 'XXI Solo Square',
                    onTapOpenBottomSheetCinema: () {
                      CustomSnackbar.info(
                        context,
                        'Fitur Pilih Bioskop belum tersedia',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
