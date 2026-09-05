import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WHomeHeader extends StatelessWidget {
  const WHomeHeader({super.key, required this.isNotificationActive, required this.onTapDetailNotification});

  final bool isNotificationActive;
  final VoidCallback onTapDetailNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: SizedBox(
            width: double.infinity,
            child: ImageLoad(
              src: Assets.images.imgBgBerandaUpper.path,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),

        Positioned(
          top: 0,
          bottom: -40,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageLoad(
                  src: Assets.icons.icLogoHome.path,
                  isAsset: true,
                  width: 40,
                  height: 40,
                ),

                GestureDetector(
                  onTap: onTapDetailNotification,
                  child: Icon(
                    isNotificationActive
                        ? Icons.notifications_rounded
                        : Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
