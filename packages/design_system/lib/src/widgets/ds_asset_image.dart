import 'package:flutter/material.dart';

import '../constants/asset_paths.dart';

class DSAssetImage extends StatelessWidget {
  const DSAssetImage(
    this.assetPath, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.colorBlendMode,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Alignment alignment;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      package: AssetPaths.packageName,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}
