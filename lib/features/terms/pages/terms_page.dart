import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/terms/bloc/terms_bloc.dart';
import 'package:reyy_cinema/features/terms/bloc/terms_event.dart';
import 'package:reyy_cinema/features/terms/bloc/terms_state.dart';
import 'package:reyy_cinema/features/terms/widgets/terms_content.dart';
import 'package:reyy_cinema/features/terms/widgets/terms_content_shimmer.dart';
import 'package:reyy_cinema/features/terms/widgets/terms_scroll_down_button.dart';
import 'package:reyy_cinema/features/terms/widgets/terms_scroll_rail.dart';
import 'package:reyy_cinema/features/terms/widgets/terms_section_error.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/state_view.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TermsBloc(),
      child: const TermsView(),
    );
  }
}

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => TermsViewState();
}

class TermsViewState extends State<TermsView> {
  final scrollController = ScrollController();
  bool showScrollButton = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(updateScrollButtonVisibility);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(updateScrollButtonVisibility)
      ..dispose();
    super.dispose();
  }

  void updateScrollButtonVisibility() {
    if (!scrollController.hasClients) {
      setState(() => showScrollButton = false);
      return;
    }

    final maxScroll = scrollController.position.maxScrollExtent;
    if (maxScroll <= 0) {
      setState(() => showScrollButton = false);
      return;
    }

    final shouldShow = scrollController.offset < maxScroll - 80;
    if (shouldShow != showScrollButton) {
      setState(() => showScrollButton = shouldShow);
    }
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
              title: 'Syarat dan Ketentuan',
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back, color: AppColors.neutral100),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  TermsScrollRail(
                    controller: scrollController,
                    child: RefreshIndicator(
                      color: AppColors.primaryPressed,
                      onRefresh: () async {
                        if (scrollController.hasClients) {
                          scrollController.jumpTo(0);
                        }
                        context.read<TermsBloc>().add(
                          const TermsLoadRequested(),
                        );
                        await context.read<TermsBloc>().stream.firstWhere(
                          (state) => !state.isLoading,
                        );
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 88, right: 8),
                        child: BlocConsumer<TermsBloc, TermsState>(
                          listener: (context, state) {
                            if (!state.isLoading && state.data != null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                updateScrollButtonVisibility();
                              });
                            }
                            if (state.isLoading || state.hasError) {
                              setState(() => showScrollButton = false);
                            }
                          },
                          builder: (context, state) {
                            final data = state.data;
                            return StateView(
                              isLoading: state.isLoading,
                              hasError: state.hasError || data == null,
                              loadingView: const TermsContentShimmer(),
                              errorView: TermsSectionError(
                                onRetry: () => context.read<TermsBloc>().add(
                                  const TermsLoadRequested(),
                                ),
                              ),
                              child: data == null
                                  ? const SizedBox.shrink()
                                  : TermsContent(
                                      htmlContent:
                                          data.htmlContent?.toString() ?? '',
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (showScrollButton)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 24,
                      child: Center(
                        child: TermsScrollDownButton(
                          onPressed: () {
                            if (!scrollController.hasClients) return;
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 450),
                              curve: Curves.easeOutCubic,
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
