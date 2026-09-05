import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WHomeBannerCarousel extends StatefulWidget {
  const WHomeBannerCarousel({
    super.key,
    required this.bannerImagePaths,
    required this.onTapDetailBanner,
  });

  final List<String> bannerImagePaths;
  final ValueChanged<int> onTapDetailBanner;

  @override
  State<WHomeBannerCarousel> createState() => _WHomeBannerCarouselState();
}

class _WHomeBannerCarouselState extends State<WHomeBannerCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final banners = widget.bannerImagePaths;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: banners.asMap().entries.map((entry) {
            final index = entry.key;
            final bannerPath = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => widget.onTapDetailBanner(index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    color: AppColors.neutral50.withValues(alpha: 0.1),
                    child: ImageLoad(
                      src: bannerPath,
                      isAsset: true,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            final isActive = index == _currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 32 : 16,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primaryPressed : AppColors.neutral50,
                borderRadius: BorderRadius.circular(100),
              ),
            );
          }),
        ),
      ],
    );
  }
}
