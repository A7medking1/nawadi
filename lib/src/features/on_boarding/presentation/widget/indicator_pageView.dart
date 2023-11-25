import 'package:alnawadi/src/core/widget/custom_indicator_widget.dart';
import 'package:alnawadi/src/features/on_boarding/data/data.dart';
import 'package:flutter/material.dart';

class IndicatorPageView extends StatelessWidget {
  final int currentIndex;

  const IndicatorPageView({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        lengthDots,
        (index) {
          return IndicatorDotsWidget(
            index: index,
            isActive: index == currentIndex,
          );
        },
      ),
    );
  }

  int get lengthDots => onBoardingItems.length;
}
