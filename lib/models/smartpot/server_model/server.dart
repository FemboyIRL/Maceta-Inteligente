import 'package:maceta_inteligente/models/flower_status_enum.dart';
import 'package:maceta_inteligente/models/plant/server_model.dart/server_model.dart';

class Smartpot {
  final int id;
  final String serialNumber;
  final String potName;
  final String ubication;
  final DateTime updatedAt;
  final String size;
  final FlowerStatusEnum status;
  final Plant? plant;

  Smartpot({
    required this.id,
    required this.serialNumber,
    required this.potName,
    required this.ubication,
    required this.updatedAt,
    required this.size,
    required this.status,
    this.plant,
  });

  factory Smartpot.fromServer(Map<String, dynamic> map) {
    return Smartpot(
      id: map['id'] as int,
      serialNumber: map['serial_number'] as String,
      potName: map['pot_name'] as String,
      ubication: map['ubication'] as String,
      updatedAt: DateTime.parse(map['updated_at'] as String),
      size: map['size'] as String,
      status: _statusFromInt(map['status'] as int),
      plant: map['plant'] != null ? Plant.fromServer(map['plant']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serial_number': serialNumber,
      'pot_name': potName,
      'ubication': ubication,
      'updated_at': updatedAt.toIso8601String(),
      'size': size,
      'status': status.index,
      'plant': plant!.id.toString(),
    };
  }

  static FlowerStatusEnum _statusFromInt(int value) {
    return FlowerStatusEnum.values[value];
  }
}
