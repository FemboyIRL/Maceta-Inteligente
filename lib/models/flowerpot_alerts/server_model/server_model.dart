import 'package:maceta_inteligente/models/alert_event_type_enum.dart';

class FlowerpotAlert {
  final int id;
  final EventType alertType;
  final String alertContent;
  final DateTime createTime;
  final int smartpot;

  FlowerpotAlert({
    required this.id,
    required this.alertType,
    required this.alertContent,
    required this.createTime,
    required this.smartpot,
  });

  factory FlowerpotAlert.fromMapServer(Map<String, dynamic> map) {
    return FlowerpotAlert(
      id: map['id'] as int,
      alertContent: map['alert_content'] as String? ?? 'No content provided',
      createTime: map['create_time'] != null
          ? DateTime.parse(map['create_time'] as String)
          : DateTime.now(),
      smartpot: map['smartpot'] as int,
      alertType: _parseAlertType(map['alert_type']),
    );
  }

  static EventType _parseAlertType(String type) {
    switch (type) {
      case 'water_event':
        return EventType.waterEvent;
      case 'peligroBajo':
        return EventType.lowRisk;
      case 'peligroMedio':
        return EventType.mediumRisk;
      case 'peligroAlto':
        return EventType.highRisk;
      default:
        return EventType.zero;
    }
  }
}
