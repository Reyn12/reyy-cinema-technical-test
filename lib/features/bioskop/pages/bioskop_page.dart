import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_bloc.dart';
import 'package:reyy_cinema/features/bioskop/sections/w_bioskop_cinema_section.dart';
import 'package:reyy_cinema/features/bioskop/sections/w_bioskop_films_section.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';

class BioskopPage extends StatelessWidget {
  const BioskopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BioskopBloc(),
      child: const BioskopView(),
    );
  }
}

class BioskopView extends StatelessWidget {
  const BioskopView({super.key});

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
                child: const Column(
                  spacing: 16,
                  children: [
                    WBioskopCinemaSection(),
                    WBioskopFilmsSection(),
                    SizedBox(height: 16),
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
