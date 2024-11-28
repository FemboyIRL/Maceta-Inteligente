import 'package:maceta_inteligente/models/plant_recomendation.dart';

class PlantConfigs {
  final int id;
  final String plantName;
  final double maxTemperature;
  final double minTemperature;
  final double maxHumidity;
  final double minHumidity;
  final double maxLightLevel;
  final double minLightLevel;
  final List<Recomendation> plantCares;

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
      id: map['id'] as int? ?? 0,
      plantName: map['plantName'] as String? ?? 'Unknown',
      maxTemperature: (map['maximum_temperature'] as num?)?.toDouble() ?? 0.0,
      minTemperature: (map['minimum_temperature'] as num?)?.toDouble() ?? 0.0,
      maxHumidity: (map['maximum_humidity'] as num?)?.toDouble() ?? 0.0,
      minHumidity: (map['minimum_humidity'] as num?)?.toDouble() ?? 0.0,
      maxLightLevel: (map['maximum_light_level'] as num?)?.toDouble() ?? 0.0,
      minLightLevel: (map['minimum_light_level'] as num?)?.toDouble() ?? 0.0,
      plantCares: List<Recomendation>.from(
        (map['plant_cares'] as List<dynamic>? ?? []).map(
          (care) => Recomendation.fromMap(care as Map<String, dynamic>),
        ),
      ),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plantName': plantName,
      'maximum_temperature': maxTemperature,
      'minimum_temperature': minTemperature,
      'maximum_humidity': maxHumidity,
      'minimum_humidity': minHumidity,
      'maximum_light_level': maxLightLevel,
      'minimum_light_level': minLightLevel,
      'plant_cares': plantCares.map((care) => care.toMap()).toList(),
    };
  }
}
