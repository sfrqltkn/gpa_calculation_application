import 'package:average_calculation/model/course.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _lettersOfAllLesson() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _letterConvertToNote(String letter) {
    switch (letter) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> lettersOfAllLesson() {
    return _lettersOfAllLesson()
        .map(
          (value) => DropdownMenuItem(
            value: _letterConvertToNote(value),
            child: Text(value),
          ),
        )
        .toList();
  }

  /// Ders Kredileri

  static List<int> _courseCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> courseCreditsAll() {
    return _courseCredits()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(
              e.toString(),
            ),
          ),
        )
        .toList();
  }

  static List<Course> allAddedLesson = [];

  static addedCourse(Course course) {
    allAddedLesson.add(course);
  }

  static double averageCalculate() {
    double totalNoteValue = 0;
    double totalCredi = 0;

    allAddedLesson.forEach((element) {
      totalNoteValue =
          totalNoteValue + (element.creditValue * element.letterValue);
      totalCredi = totalCredi + element.creditValue;
    });
    return totalNoteValue / totalCredi;
  }
}
