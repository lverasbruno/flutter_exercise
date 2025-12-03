import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/asset_paths.dart';

class DSLottie extends StatelessWidget {
  const DSLottie(
    this.assetPath, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.animate = true,
    this.repeat = true,
    this.reverse = false,
    this.controller,
    this.onLoaded,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool animate;
  final bool repeat;
  final bool reverse;
  final AnimationController? controller;
  final void Function(LottieComposition)? onLoaded;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      package: AssetPaths.packageName,
      width: width,
      height: height,
      fit: fit,
      animate: animate,
      repeat: repeat,
      reverse: reverse,
      controller: controller,
      onLoaded: onLoaded,
    );
  }
}
