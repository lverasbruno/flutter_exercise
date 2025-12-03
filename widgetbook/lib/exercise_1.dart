import 'package:flutter/material.dart';
import 'package:formfun_flutter_test/exercise_1.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Exercise1)
Widget buildExercise1(BuildContext context) {
  final percentage = context.knobs.double.slider(
    label: 'Progress',
    initialValue: 0,
    min: 0,
    max: 100,
  );

  return Exercise1(percentage: percentage);
}
