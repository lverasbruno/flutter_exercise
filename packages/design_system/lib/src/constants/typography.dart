import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class DesignSystemTypography {
  static const String fontFamily = 'AktivGrotesk';
  static const String fontPackage = 'design_system';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: DesignSystemColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: DesignSystemColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DesignSystemColors.textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: DesignSystemColors.textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DesignSystemColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: DesignSystemColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DesignSystemColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: DesignSystemColors.textSecondary,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DesignSystemColors.textMuted,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: DesignSystemColors.textMuted,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: DesignSystemColors.white,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    package: fontPackage,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DesignSystemColors.white,
  );
}
