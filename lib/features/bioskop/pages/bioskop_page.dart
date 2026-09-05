import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';

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
              child: Center(
                child: Text(
                  'Bioskop Page',
                  style: AppTypography.bodySemiboldM.copyWith(
                    color: AppColors.neutral100,
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
