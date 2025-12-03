import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/asset_paths.dart';

class DSSvg extends StatelessWidget {
  const DSSvg(
    this.assetPath, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;
  final Alignment alignment;
  final String? semanticsLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      package: AssetPaths.packageName,
      width: width,
      height: height,
      fit: fit,
      colorFilter: colorFilter,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}
