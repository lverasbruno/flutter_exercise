import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    required this.value,
    required this.onChanged,
    super.key,
    this.min = 0,
    this.max = 100,
    this.divisions = 100,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: DesignSystemColors.primary,
        inactiveTrackColor: DesignSystemColors.white.withValues(alpha: 0.1),
        thumbColor: DesignSystemColors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: Dimensions.sliderThumbRadius,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: Dimensions.sliderOverlayRadius,
        ),
        trackHeight: Dimensions.sliderTrackHeight,
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged,
      ),
    );
  }
}
