import 'package:flutter/material.dart';

class SensorCardOperationalModel {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final int flowerPotId;

  SensorCardOperationalModel({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.flowerPotId,
  });
}
