import 'package:flutter/material.dart';

class RoastModel {
  int seconds = 0;

  String get stage {
    if (seconds < 20) return "Green";
    if (seconds < 30) return "Light Brown";
    if (seconds < 40) return "Brown";
    return "Dark Brown";
  }

  Color get color {
    if (seconds < 20) return Colors.green;
    if (seconds < 30) return Colors.brown.shade400;
    if (seconds < 40) return Colors.brown;
    return Colors.brown.shade900;
  }
}