import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WHomeBackgroundHeader extends StatelessWidget {
  const WHomeBackgroundHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        width: double.infinity,
        child: ImageLoad(
          src: Assets.images.imgBgBerandaBottom.path,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}