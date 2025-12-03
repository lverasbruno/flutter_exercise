import 'package:flutter/material.dart';

import '../constants/animation_constants.dart';
import '../constants/dimensions.dart';

class ScrollAnimationController {
  ScrollAnimationController({required TickerProvider vsync})
    : _footerAnimationController = AnimationController(
        vsync: vsync,
        duration: const Duration(
          milliseconds: AnimationConstants.footerAnimationDurationMs,
        ),
      ) {
    _footerSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _footerAnimationController,
            curve: Curves.easeOut,
          ),
        );
  }

  late final AnimationController _footerAnimationController;
  late final Animation<Offset> _footerSlideAnimation;

  Animation<Offset> get footerSlideAnimation => _footerSlideAnimation;

  void handleScroll(ScrollController scrollController) {
    final currentOffset = scrollController.offset;
    final maxScroll = scrollController.position.maxScrollExtent;

    final triggerPoint = maxScroll - Dimensions.scrollTriggerDistance;
    if (currentOffset >= triggerPoint) {
      final progress =
          ((currentOffset - triggerPoint) / Dimensions.scrollTriggerDistance)
              .clamp(0.0, 1.0);
      _footerAnimationController.value = progress;
    } else {
      if (_footerAnimationController.value > 0) {
        _footerAnimationController.reverse();
      }
    }
  }

  void dispose() {
    _footerAnimationController.dispose();
  }
}
