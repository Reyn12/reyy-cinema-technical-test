import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeSectionRetry extends StatelessWidget {
  const WHomeSectionRetry({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        children: [
          Text(
            message,
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.neutral100,
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }
}
