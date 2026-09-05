import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/about_app/models/about_app_model.dart';
import 'package:reyy_cinema/features/about_app/widgets/about_app_contact_item.dart';
import 'package:reyy_cinema/resources/resources.dart';

class AboutAppContactSection extends StatelessWidget {
  const AboutAppContactSection({
    super.key,
    required this.contacts,
  });

  final List<AboutAppContactModel> contacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kontak Bantuan',
          style: AppTypography.h9Bold.copyWith(
            color: AppColors.neutral100,
          ),
        ),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final contact in contacts)
              AboutAppContactItem(contact: contact),
          ],
        ),
      ],
    );
  }
}
