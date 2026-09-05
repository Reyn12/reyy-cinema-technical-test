import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class TermsScrollRail extends StatelessWidget {
  const TermsScrollRail({
    super.key,
    required this.controller,
    required this.child,
  });

  final ScrollController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thickness: 2,
      radius: const Radius.circular(2),
      thumbVisibility: true,
      trackVisibility: true,
      interactive: false,
      padding: const EdgeInsets.only(right: 4, top: 4, bottom: 4),
      thumbColor: AppColors.neutral50,
      trackColor: AppColors.neutral30,
      trackBorderColor: Colors.transparent,
      child: child,
    );
  }
}
