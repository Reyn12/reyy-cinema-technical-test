import 'package:flutter/material.dart';

export 'app_typography.dart';

class AppColors {
  static const Color primary = Color(0xFF0297C7);
  static const Color primaryPressed = Color(0xFF002E78);
  static const Color primaryDark = Color(0xFF184892);
  static const Color primaryDarkest = Color(0xFF003762);
  static const Color primaryDeep = Color(0xFF00597B);
  static const Color primaryLight = Color(0xFFCCEAF4);
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const Color scaffoldBackgroundColor = Color(0xFFF6F7FB);
  static const Color labelPrimaryDark = Color(0xFFEBF6FF);
  static const Color border = Color(0xFFF1F1F1);
  static const Color greyLight = Color(0xFFF1F1F1);

  static const Color warningMain = Color(0xFFEBBC46);
  static const Color warningBorder = Color(0xFFEEC765);
  static const Color orangeMain = Color(0xFFE18F2C);
  static const Color orangeSurface = Color(0xFFFFF0DE);

  static const Color success = Color(0xFF43936C);
  static const Color successSurface = Color(0xFFD8F5E7);
  static const Color warning = Color(0xFFFF901A);
  static const Color warningSurface = Color(0xFFFBF2DA);
  static const Color error = Color(0xFFCB3A31);
  static const Color errorSurface = Color(0xFFFFF4F2);
  static const Color info = Color(0xFF0297C7);
  static const Color infoSurface = Color(0xFFE6F5F9);
  static const Color empty = Color(0xFF757575);
  static const Color emptySurface = Color(0xFFE6F5F9);
  static const Color primarySurface = Color(0xFFE8EDF4);
  static const Color primarySurfaceAlt = Color(0xFFE6F5F9);

  static const Color shadesPrimary10 = Color(0xFFE8EDF4);
  static const Color shadesPrimary20 = Color(0xFFD1DAE9);
  static const Color shadesPrimary30 = Color(0xFFBAC8DE);
  static const Color shadesPrimary40 = Color(0xFFA2B6D3);
  static const Color shadesPrimary50 = Color(0xFF8BA3C8);
  static const Color shadesPrimary60 = Color(0xFF7491BE);
  static const Color shadesPrimary70 = Color(0xFF5D7FB3);
  static const Color shadesPrimary80 = Color(0xFF466DA8);
  static const Color shadesPrimary90 = Color(0xFF2F5A9D);
  static const Color shadesPrimary100 = Color(0xFF184892);

  static const Color shadesPrimaryLight10 = Color(0xFFE6F5F9);
  static const Color shadesPrimaryLight20 = Color(0xFFCCEAF4);
  static const Color shadesPrimaryLight30 = Color(0xFFB3E0EE);
  static const Color shadesPrimaryLight40 = Color(0xFF80CBE3);
  static const Color shadesPrimaryLight50 = Color(0xFF80CBE3);
  static const Color shadesPrimaryLight60 = Color(0xFF67C0DD);
  static const Color shadesPrimaryLight70 = Color(0xFF4EB6D8);
  static const Color shadesPrimaryLight80 = Color(0xFF35ACD2);
  static const Color shadesPrimaryLight90 = Color(0xFF1BA1CD);
  static const Color shadesPrimaryLight100 = Color(0xFF0297C7);

  static const Color textColor10 = Color(0xFFE7E7E7);
  static const Color textColor20 = Color(0xFFCFCFCF);
  static const Color textColor30 = Color(0xFFB3B3B3);
  static const Color textColor40 = Color(0xFF9E9E9E);
  static const Color textColor50 = Color(0xFF808080);
  static const Color textColor60 = Color(0xFF666666);
  static const Color textColor70 = Color(0xFF4C4C4C);
  static const Color textColor80 = Color(0xFF333333);
  static const Color textColor90 = Color(0xFF1A1A1A);
  static const Color textColor100 = Color(0xFF000000);

  static const Color neutral4 = Color(0xFFF0F0F0);
  static const Color neutral10 = Color(0xFFFFFFFF);
  static const Color neutral15 = Color(0xFFF3F3F3);
  static const Color neutral20 = Color(0xFFF5F5F5);
  static const Color neutral30 = Color(0xFFEDEDED);
  static const Color neutral40 = Color(0xFFE0E0E0);
  static const Color neutral50 = Color(0xFFC2C2C2);
  static const Color neutral60 = Color(0xFF9E9E9E);
  static const Color neutral70 = Color(0xFF757575);
  static const Color neutral80 = Color(0xFF616161);
  static const Color neutral90 = Color(0xFF404040);
  static const Color neutral100 = Color(0xFF0A0A0A);
}

class AppShadows {
  /// Drop shadow: x 0, y 2, blur 25, spread 0, #000 @ 7%
  static List<BoxShadow> get soft => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.07),
      blurRadius: 25,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get smooth => soft;
}
