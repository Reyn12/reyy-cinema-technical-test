import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/bloc/home_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_event.dart';
import 'package:reyy_cinema/features/home/sections/w_home_banner_section.dart';
import 'package:reyy_cinema/features/home/sections/w_home_films_section.dart';
import 'package:reyy_cinema/features/home/sections/w_home_hero_section.dart';
import 'package:reyy_cinema/features/home/sections/w_home_sorotan_section_view.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_header.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeBloc(), child: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            WHomeHeader(
              isNotificationActive: true,
              onTapDetailNotification: () {
                context.push(AppPaths.reminder);
              },
            ),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryPressed,
                onRefresh: () async {
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(0);
                  }
                  context.read<HomeBloc>().add(const HomeLoadRequested());
                  await context.read<HomeBloc>().stream.firstWhere(
                    (state) => !state.isAnyLoading,
                  );
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  child: const Column(
                    spacing: 24,
                    children: [
                      WHomeHeroSection(),
                      WHomeBannerSection(),
                      WHomeSorotanSectionView(),
                      WHomeFilmsSection(),
                      SizedBox(height: 8),
                    ],
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
