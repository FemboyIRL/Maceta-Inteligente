import 'dart:math';

import 'package:flutter/material.dart';

abstract class ColorsMethods {
  static Color get selectedItemColor => const Color(0xff27c24c);

  static Color? getItemsColorByBackground(final Color? backgroundColor) {
    if (backgroundColor == null || backgroundColor == Colors.transparent) {
      return null;
    }

    final luminance = ((0.299 * backgroundColor.red) +
        (0.587 * backgroundColor.green) +
        (0.114 * backgroundColor.blue));

    if (luminance > 128) {
      return Colors.black;
    }

    return Colors.white;
  }

  static Color getColorOfBrightness(final Brightness brightness) {
    if (brightness == Brightness.dark) return Colors.white;
    return Colors.black;
  }

  static Color getRandomColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }
}