import 'dart:ui';

import 'package:flutter/material.dart';

enum EventType {
  zero,
  lowRisk,
  mediumRisk,
  waterEvent,
  highRisk,
}

extension EventTypeColors on EventType {
  Color getBackgroundColor(bool isActive) {
    switch (this) {
      case EventType.lowRisk:
        return isActive ? Colors.green[100]! : Colors.green[200]!;
      case EventType.mediumRisk:
        return isActive ? Colors.orange[100]! : Colors.orange[200]!;
      case EventType.highRisk:
        return isActive ? Colors.red[100]! : Colors.red[200]!;
      case EventType.waterEvent:
        return isActive ? Colors.blue[100]! : Colors.blue[200]!;
      case EventType.zero:
      default:
        return Colors.grey[200]!;
    }
  }

  Color getIconColor(bool isActive) {
    switch (this) {
      case EventType.lowRisk:
        return isActive ? Colors.green : Colors.green[700]!;
      case EventType.mediumRisk:
        return isActive ? Colors.orange : Colors.orange[700]!;
      case EventType.highRisk:
        return isActive ? Colors.red : Colors.red[700]!;
      case EventType.waterEvent:
        return isActive ? Colors.blue : Colors.blue[700]!;
      case EventType.zero:
      default:
        return Colors.grey;
    }
  }

  Color getTextColor(bool isActive) {
    switch (this) {
      case EventType.lowRisk:
      case EventType.mediumRisk:
      case EventType.highRisk:
      case EventType.waterEvent:
        return isActive ? Colors.black : Colors.white;
      case EventType.zero:
      default:
        return Colors.black;
    }
  }
}

extension EventTypeIcons on EventType {
  IconData get icon {
    switch (this) {
      case EventType.lowRisk:
        return Icons.thumb_up; 
      case EventType.mediumRisk:
        return Icons.warning; 
      case EventType.highRisk:
        return Icons.error; 
      case EventType.waterEvent:
        return Icons.water_drop;
      case EventType.zero:
      default:
        return Icons.info;
    }
  }
}
