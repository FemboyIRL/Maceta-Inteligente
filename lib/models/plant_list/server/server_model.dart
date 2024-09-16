import 'package:maceta_inteligente/models/plant_data/server/server_model.dart';

class PlantList {
  final List<Plant> plantsData;
  final int to;
  final int porPagina;
  final int paginaActual;
  final int from;
  final int ultimaPagina;
  final int total;
  const PlantList({
    required this.to,
    required this.porPagina,
    required this.paginaActual,
    required this.from,
    required this.ultimaPagina,
    required this.total,
    required this.plantsData,
  });

  factory PlantList.fromJson(Map<String, dynamic> json) {
    return PlantList(
      to: json["to"],
      porPagina: json["per_page"],
      paginaActual: json["current_page"],
      from: json["from"],
      ultimaPagina: json["last_page"],
      total: json["total"],
      plantsData: (json["data"] as List)
          .map((plantJson) => Plant.fromJson(plantJson))
          .toList(),
    );
  }
}
