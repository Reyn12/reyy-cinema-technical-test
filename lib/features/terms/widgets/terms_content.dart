import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:reyy_cinema/resources/app_theme.dart';
import 'package:reyy_cinema/resources/resources.dart';

class TermsContent extends StatelessWidget {
  const TermsContent({
    super.key,
    required this.htmlContent,
  });

  final String htmlContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Html(
        data: htmlContent,
        style: {
          'body': Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
            fontFamily: AppFonts.plusJakartaSans,
            color: AppColors.neutral90,
            fontSize: FontSize(14),
            lineHeight: LineHeight(1.5),
          ),
          'p': Style(
            margin: Margins.only(bottom: 16),
            padding: HtmlPaddings.zero,
            color: AppColors.neutral90,
            fontSize: FontSize(14),
            lineHeight: LineHeight(1.5),
          ),
          'ol': Style(
            margin: Margins.zero,
            padding: HtmlPaddings.only(left: 20),
            listStyleType: ListStyleType.decimal,
            listStylePosition: ListStylePosition.outside,
          ),
          'ul': Style(
            margin: Margins.only(top: 8, bottom: 12),
            padding: HtmlPaddings.only(left: 16),
            listStyleType: ListStyleType.disc,
            listStylePosition: ListStylePosition.outside,
          ),
          'li': Style(
            margin: Margins.only(bottom: 8),
            padding: HtmlPaddings.zero,
            color: AppColors.neutral90,
            fontSize: FontSize(14),
            lineHeight: LineHeight(1.5),
          ),
          'strong': Style(
            fontWeight: FontWeight.w700,
            color: AppColors.neutral100,
            fontSize: FontSize(14),
          ),
        },
      ),
    );
  }
}
