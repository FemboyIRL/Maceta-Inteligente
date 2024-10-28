class PlantConfigs {
  final int id;
  final String plantName;
  final double maxTemperature;
  final double minTemperature;
  final double maxHumidity;
  final double minHumidity;
  final double maxLightLevel;
  final double minLightLevel;
  final List<String> plantCares;

  PlantConfigs({
    required this.id,
    required this.plantName,
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxLightLevel,
    required this.minLightLevel,
    required this.plantCares,
  });

  factory PlantConfigs.fromServer(Map<String, dynamic> map) {
    return PlantConfigs(
      id: map['id'] as int,
      plantName: map['plantName'] as String,
      maxTemperature: (map['maximum_temperature'] as num).toDouble(),
      minTemperature: (map['minimum_temperature'] as num).toDouble(),
      maxHumidity: (map['maximum_humidity'] as num).toDouble(),
      minHumidity: (map['minimum_humidity'] as num).toDouble(),
      maxLightLevel: (map['maximum_light_level'] as num).toDouble(),
      minLightLevel: (map['minimum_light_level'] as num).toDouble(),
      plantCares: List<String>.from(map['plant_cares'] as List<String>),
    );
  }
}
