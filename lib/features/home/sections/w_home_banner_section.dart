import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_bloc.dart';
import 'package:reyy_cinema/features/home/bloc/home_event.dart';
import 'package:reyy_cinema/features/home/bloc/home_state.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_banner_carousel.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_banner_carousel_shimmer.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class WHomeBannerSection extends StatelessWidget {
  const WHomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) =>
          prev.isBannersLoading != curr.isBannersLoading ||
          prev.hasBannersError != curr.hasBannersError ||
          prev.banners != curr.banners,
      builder: (context, state) {
        if (state.isBannersLoading) {
          return const WHomeBannerCarouselShimmer();
        }

        if (state.hasBannersError || state.banners.isEmpty) {
          return WHomeSectionRetry(
            message: 'Gagal memuat banner',
            onRetry: () => context.read<HomeBloc>().add(
              const HomeLoadRequested(),
            ),
          );
        }

        return WHomeBannerCarousel(
          bannerImagePaths: state.bannerImagePaths,
          onTapDetailBanner: (_) {
            CustomSnackbar.info(
              context,
              'Fitur Detail Banner belum tersedia',
            );
          },
        );
      },
    );
  }
}
