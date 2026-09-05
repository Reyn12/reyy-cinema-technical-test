import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/app_typography.dart';

class WHomeGreetings extends StatelessWidget {
  const WHomeGreetings({super.key, required this.nameParent});

  final String nameParent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halo, Selamat Datang di Reyy Cinema!",
            style: AppTypography.bodyRegularM.copyWith(color: Colors.white),
          ),
          Text(
            nameParent,
            style: AppTypography.h8Bold.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
