import 'package:maceta_inteligente/models/alert_event_type_enum.dart';

class FlowerpotAlert {
  final int id;
  final EventType eventType;
  final String message;
  final DateTime date;
  bool isActive;

  FlowerpotAlert({
    required this.id,
    required this.eventType,
    required this.message,
    required this.date,
    this.isActive = true,
  });

  factory FlowerpotAlert.fromMapServer(Map<String, dynamic> map) {
    return FlowerpotAlert(
      id: map['id'] as int,
      message: map['message'] ?? 'No message provided',
      date: DateTime.parse(map['date']),
      isActive: map['isActive'] ?? true,
      eventType: _parseEventType(map['eventType']),
    );
  }
  static EventType _parseEventType(String level) {
    switch (level) {
      case 'water_event':
        return EventType.waterEvent;
      case 'low':
        return EventType.lowRisk;
      case 'medium':
        return EventType.mediumRisk;
      case 'high':
        return EventType.highRisk;
      default:
        return EventType.zero;
    }
  }
}
