class FlowerpotSensor {
  final int id;
  final int potId;
  final double humidity;
  final double temperature;
  final double lightLevel;
  final double waterLevel;
  final DateTime registerDateTime;

  FlowerpotSensor({ 
    required this.id,
    required this.potId,
    required this.humidity,
    required this.temperature,
    required this.lightLevel,
    required this.waterLevel,
    required this.registerDateTime,
  });

  factory FlowerpotSensor.fromServer(Map<String, dynamic> map) {
    return FlowerpotSensor(
      id: map['id'] as int,
      potId: map['potId'] as int,
      humidity: (map['humidity'] as num).toDouble(),
      temperature: (map['temperature'] as num).toDouble(),
      lightLevel: (map['lightLevel'] as num).toDouble(),
      waterLevel: (map['waterLevel'] as num).toDouble(),
      registerDateTime: DateTime.parse(map['registerDateTime'] as String),
    );
  }
}
