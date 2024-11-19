import 'package:maceta_inteligente/models/flower_status_enum.dart';

class Smartpot {
  final int id;
  final String serialNumber;
  final String potName;
  final String ubication;
  final DateTime updatedAt;
  final String size;
  final FlowerStatusEnum status;
  final int userProfileId;
  final int? plantId;

  Smartpot({
    required this.id,
    required this.serialNumber,
    required this.potName,
    required this.ubication,
    required this.updatedAt,
    required this.size,
    required this.status,
    required this.userProfileId,
    this.plantId,
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
      userProfileId: map['user_profile_id'] as int,
      plantId: map['plant_id'] as int?,
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
      'status': status,
      'user_profile_id': userProfileId,
      'plant_id': plantId,
    };
  }

  static FlowerStatusEnum _statusFromInt(int value) {
    return FlowerStatusEnum.values[value];
  }
}
