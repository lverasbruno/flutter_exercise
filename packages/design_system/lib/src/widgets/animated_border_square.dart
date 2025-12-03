import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class AnimatedBorderSquare extends StatelessWidget {
  const AnimatedBorderSquare({
    required this.percentage,
    required this.child,
    required this.isDark,
    super.key,
  });

  final double percentage;
  final Widget child;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.progressCardWidth,
      height: Dimensions.progressCardHeight,
      child: Stack(
        children: [
          _BackgroundContainer(isDark: isDark, child: child),
          const _StaticBorder(),
          _AnimatedProgressBorder(percentage: percentage),
        ],
      ),
    );
  }
}

class _BackgroundContainer extends StatelessWidget {
  const _BackgroundContainer({required this.isDark, required this.child});

  final bool isDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? DesignSystemColors.black : DesignSystemColors.surfaceCardLight,
        borderRadius: BorderRadius.circular(Dimensions.radiusXl),
        boxShadow: const [
          BoxShadow(
            color: DesignSystemColors.shadowPrimary,
            blurRadius: Dimensions.shadowBlurLg,
            offset: Offset(0, Dimensions.shadowOffsetYLg),
          ),
          BoxShadow(
            color: DesignSystemColors.shadowSecondary,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: DesignSystemColors.glow,
            blurRadius: Dimensions.shadowBlurLg,
            blurStyle: BlurStyle.outer,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: child,
      ),
    );
  }
}

class _StaticBorder extends StatelessWidget {
  const _StaticBorder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusXl),
        border: Border.all(color: DesignSystemColors.borderDefault),
      ),
    );
  }
}

class _AnimatedProgressBorder extends StatelessWidget {
  const _AnimatedProgressBorder({required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _AnimatedBorderPainter(percentage: percentage),
        size: const Size(
          Dimensions.progressCardWidth,
          Dimensions.progressCardHeight,
        ),
      ),
    );
  }
}

class _AnimatedBorderPainter extends CustomPainter {
  _AnimatedBorderPainter({required this.percentage});

  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    if (percentage <= 0 || percentage > 100) {
      return;
    }

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final radius = BorderRadius.circular(Dimensions.radiusXl).resolve(TextDirection.ltr);
    final rrect = radius.toRRect(rect);
    final fullPath = Path()..addRRect(rrect);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = Dimensions.strokeWidth
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter
      ..isAntiAlias = true
      ..color = DesignSystemColors.borderActive;

    final metricsList = fullPath.computeMetrics().toList();
    if (metricsList.isEmpty) {
      return;
    }

    final pathMetric = metricsList.first;
    final totalLength = pathMetric.length;
    if (totalLength <= 0) {
      return;
    }

    final startOffset = _findCenterTopOffset(pathMetric, size.width / 2, totalLength);
    final lengthToDraw = (totalLength * percentage / 100).clamp(0.0, totalLength);

    if (lengthToDraw > 0) {
      final filledPath = _extractProgressPath(
        pathMetric,
        startOffset,
        lengthToDraw,
        totalLength,
      );
      canvas.drawPath(filledPath, paint);
    }
  }

  double _findCenterTopOffset(PathMetric metric, double centerX, double totalLength) {
    const sampleCount = 2000;
    double minDistance = double.infinity;
    double bestOffset = 0;

    for (int i = 0; i <= sampleCount; i++) {
      final offset = totalLength * i / sampleCount;
      final tangent = metric.getTangentForOffset(offset);
      if (tangent != null) {
        final point = tangent.position;
        if (point.dy < 3 && (point.dx - centerX).abs() < minDistance) {
          minDistance = (point.dx - centerX).abs();
          bestOffset = offset;
        }
      }
    }

    return bestOffset.clamp(0.0, totalLength);
  }

  Path _extractProgressPath(
    PathMetric metric,
    double startOffset,
    double length,
    double totalLength,
  ) {
    final endOffset = startOffset + length;

    if (endOffset <= totalLength) {
      return metric.extractPath(startOffset, endOffset);
    }

    final path1 = metric.extractPath(startOffset, totalLength);
    final path2 = metric.extractPath(0, endOffset - totalLength);
    return Path()
      ..addPath(path1, Offset.zero)
      ..addPath(path2, Offset.zero);
  }

  @override
  bool shouldRepaint(_AnimatedBorderPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
