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
      smartpotId: map['id'] as int,
      temperatureMax: _parseDouble(map['maximun_temperature']),
      temperatureMin: _parseDouble(map['minimun_temperature']),
      humidityMax: _parseDouble(map['maximun_humidity']),
      humidityMin: _parseDouble(map['minimun_humidity']),
      lightMax: _parseDouble(map['maximun_ligth_level']),
      lightMin: _parseDouble(map['minimun_ligth_level']),
      notificationsEnabled: map['notifications_is_activated'] as bool? ?? false,
    );
  }

  static double _parseDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ??
          0.0; // Si es String, intenta convertirlo a double
    } else if (value is num) {
      return value.toDouble(); // Si ya es un número, lo convierte a double
    } else {
      return 0.0; // Si no es ni String ni num, retorna 0.0
    }
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
      'notifications_is_activated': notificationsEnabled,
    };
  }
}
