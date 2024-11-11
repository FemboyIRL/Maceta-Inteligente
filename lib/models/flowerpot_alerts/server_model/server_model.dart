enum DangerLevel {
  zero,
  low,
  medium,
  high,
}

class FlowerpotAlert {
  final int id;
  final DangerLevel dangerLevel;
  final String message;
  final DateTime date;
  bool isActive;

  FlowerpotAlert({
    required this.id,
    required this.dangerLevel,
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
      dangerLevel: _parseDangerLevel(map['dangerLevel']),
    );
  }
  static DangerLevel _parseDangerLevel(String level) {
    switch (level) {
      case 'low':
        return DangerLevel.low;
      case 'medium':
        return DangerLevel.medium;
      case 'high':
        return DangerLevel.high;
      default:
        return DangerLevel.zero;
    }
  }
}
