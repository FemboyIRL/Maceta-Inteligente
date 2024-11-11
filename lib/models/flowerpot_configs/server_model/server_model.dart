class FlowerpotConfigs {
  double temperatureMax;
  double temperatureMin;
  double humidityMax;
  double humidityMin;
  double lightMax;
  double lightMin;
  bool notificationsEnabled;

  FlowerpotConfigs({
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
      temperatureMax: map['temperatureMax'],
      temperatureMin: map['temperatureMin'],
      humidityMax: map['humidityMax'],
      humidityMin: map['humidityMin'],
      lightMax: map['lightMax'],
      lightMin: map['lightMin'],
      notificationsEnabled: map['notificationsEnabled'],
    );
  }
}
