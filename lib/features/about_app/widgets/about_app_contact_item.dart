import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/about_app/models/about_app_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class AboutAppContactItem extends StatelessWidget {
  const AboutAppContactItem({
    super.key,
    required this.contact,
  });

  final AboutAppContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: AppColors.neutral70,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '${contact.label}: ${contact.value}',
            style: AppTypography.bodyRegularM.copyWith(
              color: AppColors.neutral70,
            ),
          ),
        ),
      ],
    );
  }
}
