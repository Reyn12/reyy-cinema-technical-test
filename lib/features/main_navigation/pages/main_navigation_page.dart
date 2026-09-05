import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/bioskop/pages/bioskop_page.dart';
import 'package:reyy_cinema/features/home/pages/home_page.dart';
import 'package:reyy_cinema/features/main_navigation/bloc/main_navigation_bloc.dart';
import 'package:reyy_cinema/features/main_navigation/bloc/main_navigation_event.dart';
import 'package:reyy_cinema/features/main_navigation/widgets/custom_bottom_nav.dart';
import 'package:reyy_cinema/features/reminder/pages/reminder_page.dart';
import 'package:reyy_cinema/features/profile/pages/profile_page.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  static List<NavItem> navItems = [
    NavItem(
      label: 'Beranda',
      iconPath: Assets.icons.icBeranda.path,
      activeIconPath: Assets.icons.icBerandaActive.path,
    ),
    NavItem(
      label: 'Bioskop',
      iconPath: Assets.icons.icBioskop.path,
      activeIconPath: Assets.icons.icBioskopActive.path,
    ),
    NavItem(
      label: 'Reminder',
      iconPath: Assets.icons.icNotifikasi.path,
      activeIconPath: Assets.icons.icNotifikasiActive.path,
    ),
    NavItem(
      label: 'Profil',
      iconPath: Assets.icons.icProfile.path,
      activeIconPath: Assets.icons.icProfileActive.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainNavigationBloc(),
      child: const _MainNavigationView(),
    );
  }
}

class _MainNavigationView extends StatelessWidget {
  const _MainNavigationView();

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<MainNavigationBloc>().state;

    final pages = [
      const HomePage(key: ValueKey('home')),
      const BioskopPage(key: ValueKey('bioskop')),
      const ReminderPage(key: ValueKey('reminder')),
      const ProfilePage(key: ValueKey('profile')),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await CustomSnackbar.doubleBackToExit(context);
        if (shouldExit) {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: IndexedStack(index: currentIndex, children: pages),
          bottomNavigationBar: CustomBottomNav(
            currentIndex: currentIndex,
            navItems: MainNavigationPage.navItems,
            onNavItemSelected: (index) => context.read<MainNavigationBloc>().add(
              MainNavigationPageChanged(index),
            ),
          ),
        ),
      ),
    );
  }
}
