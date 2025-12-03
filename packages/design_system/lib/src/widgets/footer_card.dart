import 'package:flutter/material.dart';

import '../constants/asset_paths.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../constants/spacing.dart';
import '../constants/typography.dart';

class FooterCard extends StatelessWidget {
  const FooterCard({
    super.key,
    this.title = 'Form&Fun',
    this.subtitle = 'formandfun.co',
    this.onActionPressed,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(DesignSystemSpacing.md),
      padding: const EdgeInsets.all(DesignSystemSpacing.lg - 4),
      decoration: BoxDecoration(
        color: DesignSystemColors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
        boxShadow: [
          BoxShadow(
            color: DesignSystemColors.black.withValues(alpha: 0.1),
            blurRadius: Dimensions.shadowBlurLg,
            offset: const Offset(0, Dimensions.shadowOffsetY),
          ),
        ],
      ),
      child: Row(
        children: [
          _LogoImage(),
          const SizedBox(width: DesignSystemSpacing.sm),
          Expanded(
            child: _TextContent(title: title, subtitle: subtitle),
          ),
          _ActionButton(onPressed: onActionPressed),
        ],
      ),
    );
  }
}

class _LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.footerCardIconSize,
      height: Dimensions.footerCardIconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusXs),
        color: DesignSystemColors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radiusXs),
        child: Image.asset(
          AssetPaths.ffLogo,
          package: AssetPaths.packageName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: DesignSystemTypography.titleLarge),
        const SizedBox(height: 4),
        Text(subtitle, style: DesignSystemTypography.label),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Dimensions.footerCardButtonSize,
        height: Dimensions.footerCardButtonSize,
        decoration: BoxDecoration(
          color: DesignSystemColors.textPrimary,
          borderRadius: BorderRadius.circular(Dimensions.radiusLg),
        ),
        child: const Icon(
          Icons.camera_alt,
          color: DesignSystemColors.white,
          size: Dimensions.iconSm,
        ),
      ),
    );
  }
}
