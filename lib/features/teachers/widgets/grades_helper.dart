import 'package:flutter/material.dart';

class GradesHelper {
  static getGrade(int marks) {
    if (marks >= 90) return "A";
    if (marks >= 80) return "B";
    if (marks >= 70) return "C";
    if (marks >= 50) return "D";
    return "F";
  }

  static percentColor(int value) {
    if (value >= 90 && value <= 100) return Colors.green;
    if (value >= 60) return Colors.orange;
    return Colors.red;
  }
}
