import 'package:flutter/material.dart';

enum EventType {
  zero,
  lowRisk,
  mediumRisk,
  waterEvent,
  highRisk,
}

extension EventTypeExtensions on EventType {
  Color getBackgroundColor() {
    switch (this) {
      case EventType.highRisk:
        return Colors.red[400]!;
      case EventType.mediumRisk:
        return Colors.orange[300]!;
      case EventType.lowRisk:
        return Colors.green[300]!;
      case EventType.waterEvent:
        return Colors.blue[300]!;
      default:
        return Colors.grey[300]!;
    }
  }

  IconData get icon {
    switch (this) {
      case EventType.highRisk:
        return Icons.warning;
      case EventType.mediumRisk:
        return Icons.error_outline;
      case EventType.lowRisk:
        return Icons.check_circle_outline;
      case EventType.waterEvent:
        return Icons.water_drop;
      default:
        return Icons.help_outline;
    }
  }

  Color getTextColor() => Colors.black;

  Color getIconColor() => Colors.black;
}
