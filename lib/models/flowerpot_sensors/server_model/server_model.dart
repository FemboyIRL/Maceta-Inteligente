class FlowerpotSensor {
  final int id;
  final double humidity;
  final double temperature;
  final double lightLevel;
  final double waterLevel;
  final DateTime registerDateTime;

  FlowerpotSensor({
    required this.id,
    required this.humidity,
    required this.temperature,
    required this.lightLevel,
    required this.waterLevel,
    required this.registerDateTime,
  });

  factory FlowerpotSensor.fromMapServer(Map<String, dynamic> map) {
    return FlowerpotSensor(
      id: map['id'] as int,
      humidity: double.parse(map['floor_humidity'] as String? ?? '0.0'),
      temperature: double.parse(map['temperature'] as String? ?? '0.0'),
      lightLevel: (map['light_level'] as num?)?.toDouble() ?? 0.0,
      waterLevel: (map['water_level'] as num?)?.toDouble() ?? 0.0,
      registerDateTime: map['registed_at'] != null
          ? DateTime.parse(map['registed_at'] as String)
          : DateTime.now(),
    );
  }
}
