import 'package:average_calculation/constant/app_constant.dart';
import 'package:flutter/material.dart';

class AverageShow extends StatelessWidget {
  final double average;
  final int lessonCount;
  const AverageShow(
      {super.key, required this.average, required this.lessonCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? '$lessonCount Lesson Entered' : 'Choose a Lesson',
          style: Constant.lessonCountAndAverageStyle,
        ),
        Text(
          average >= 0 ? average.toStringAsFixed(2) : '0.0',
          style: Constant.averageResultTextStyle,
        ),
        Text(
          "Average",
          style: Constant.lessonCountAndAverageStyle,
        ),
      ],
    );
  }
}
