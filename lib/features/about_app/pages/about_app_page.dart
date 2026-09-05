import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/about_app/bloc/about_app_bloc.dart';
import 'package:reyy_cinema/features/about_app/bloc/about_app_event.dart';
import 'package:reyy_cinema/features/about_app/bloc/about_app_state.dart';
import 'package:reyy_cinema/features/about_app/widgets/about_app_content.dart';
import 'package:reyy_cinema/features/about_app/widgets/about_app_content_shimmer.dart';
import 'package:reyy_cinema/features/about_app/widgets/about_app_section_error.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutAppBloc(),
      child: const AboutAppView(),
    );
  }
}

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => AboutAppViewState();
}

class AboutAppViewState extends State<AboutAppView> {
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
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.neutral20,
        body: Column(
          spacing: 16,
          children: [
            AppHeader(
              title: 'Tentang Aplikasi',
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back, color: AppColors.neutral100),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryPressed,
                onRefresh: () async {
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(0);
                  }
                  context.read<AboutAppBloc>().add(
                    const AboutAppLoadRequested(),
                  );
                  await context.read<AboutAppBloc>().stream.firstWhere(
                    (state) => !state.isLoading,
                  );
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 24),
                  child: BlocBuilder<AboutAppBloc, AboutAppState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const AboutAppContentShimmer();
                      }
                      if (state.hasError || state.data == null) {
                        return AboutAppSectionError(
                          onRetry: () => context.read<AboutAppBloc>().add(
                            const AboutAppLoadRequested(),
                          ),
                        );
                      }
                      return AboutAppContent(about: state.data!);
                    },
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
