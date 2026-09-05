import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WProfileBackgroundHeader extends StatelessWidget {
  const WProfileBackgroundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        width: double.infinity,
        child: ImageLoad(
          src: Assets.images.imgBgProfileBottom.path,
          isAsset: true,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
