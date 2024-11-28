class FlowerpotConfigs {
  final int smartpotId;
  double temperatureMax;
  double temperatureMin;
  double humidityMax;
  double humidityMin;
  double lightMax;
  double lightMin;
  bool notificationsEnabled;

  FlowerpotConfigs({
    required this.smartpotId,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.humidityMax,
    required this.humidityMin,
    required this.lightMax,
    required this.lightMin,
    required this.notificationsEnabled,
  });

  factory FlowerpotConfigs.fromMapServer(Map<String, dynamic> map) {
    return FlowerpotConfigs(
      smartpotId: map['smartpot_id'] as int,
      temperatureMax: (map['temperatureMax'] as num?)?.toDouble() ?? 0.0,
      temperatureMin: (map['temperatureMin'] as num?)?.toDouble() ?? 0.0,
      humidityMax: (map['humidityMax'] as num?)?.toDouble() ?? 0.0,
      humidityMin: (map['humidityMin'] as num?)?.toDouble() ?? 0.0,
      lightMax: (map['lightMax'] as num?)?.toDouble() ?? 0.0,
      lightMin: (map['lightMin'] as num?)?.toDouble() ?? 0.0,
      notificationsEnabled: map['notificationsEnabled'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'smartpot_id': smartpotId,
      'temperatureMax': temperatureMax,
      'temperatureMin': temperatureMin,
      'humidityMax': humidityMax,
      'humidityMin': humidityMin,
      'lightMax': lightMax,
      'lightMin': lightMin,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
