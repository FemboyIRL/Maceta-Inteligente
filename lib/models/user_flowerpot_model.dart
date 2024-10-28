import 'package:maceta_inteligente/models/flower_status_enum.dart';

class MyFlowerpotOperationalModel {
  final int id;
  final int userID;
  final FlowerStatusEnum status;
  final String plantName;
  final String potName;
  final String location;
  final DateTime lastUpdated;

  const MyFlowerpotOperationalModel({
    required this.id,
    required this.userID,
    required this.plantName,
    required this.status,
    required this.potName,
    required this.location,
    required this.lastUpdated,
  });
}
