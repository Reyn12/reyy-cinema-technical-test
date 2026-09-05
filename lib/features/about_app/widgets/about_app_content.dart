import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/about_app/models/about_app_model.dart';
import 'package:reyy_cinema/features/about_app/widgets/about_app_brand_header.dart';
import 'package:reyy_cinema/features/about_app/widgets/about_app_contact_section.dart';
import 'package:reyy_cinema/resources/resources.dart';

class AboutAppContent extends StatelessWidget {
  const AboutAppContent({super.key, required this.about});

  final AboutAppModel about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutAppBrandHeader(
            appName: about.appName.toString(),
            version: about.version.toString(),
          ),
          Text(
            about.description.toString(),
            style: AppTypography.bodyRegularM.copyWith(
              color: AppColors.neutral70,
              height: 1.5,
            ),
          ),
          AboutAppContactSection(contacts: about.contacts ?? []),
        ],
      ),
    );
  }
}
