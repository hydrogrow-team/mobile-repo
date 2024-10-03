import 'package:flutter/material.dart';

/// stepper text
Text stepperText(String text) => Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );

/// step

Step stepWidget(
        {required int activeIndex,
        required int index,
        required String title,
        required Widget widget}) =>
    Step(
        stepStyle: const StepStyle(
          color: Colors.green,
        ),
        isActive: activeIndex >= index,
        state: activeIndex >= index ? StepState.complete : StepState.editing,
        title: stepperText(title),
        content: widget);

