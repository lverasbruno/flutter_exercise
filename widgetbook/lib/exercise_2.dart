import 'package:flutter/material.dart';
import 'package:formfun_flutter_test/exercise_2.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Exercise2)
Widget buildExercise2(BuildContext context) {
  return const Exercise2();
}
