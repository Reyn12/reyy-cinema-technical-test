import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/faq/bloc/faq_bloc.dart';
import 'package:reyy_cinema/features/faq/bloc/faq_event.dart';
import 'package:reyy_cinema/features/faq/bloc/faq_state.dart';
import 'package:reyy_cinema/features/faq/widgets/faq_list_builder.dart';
import 'package:reyy_cinema/features/faq/widgets/faq_list_builder_shimmer.dart';
import 'package:reyy_cinema/features/faq/widgets/faq_section_error.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/state_view.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FaqBloc(),
      child: const FaqView(),
    );
  }
}

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => FaqViewState();
}

class FaqViewState extends State<FaqView> {
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
              title: 'FAQ',
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
                  context.read<FaqBloc>().add(const FaqLoadRequested());
                  await context.read<FaqBloc>().stream.firstWhere(
                    (state) => !state.isLoading,
                  );
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 24),
                  child: BlocBuilder<FaqBloc, FaqState>(
                    builder: (context, state) {
                      return StateView(
                        isLoading: state.isLoading,
                        hasError: state.hasError,
                        loadingView: const FaqListBuilderShimmer(),
                        errorView: FaqSectionError(
                          onRetry: () => context.read<FaqBloc>().add(
                            const FaqLoadRequested(),
                          ),
                        ),
                        child: FaqListBuilder(items: state.items),
                      );
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
