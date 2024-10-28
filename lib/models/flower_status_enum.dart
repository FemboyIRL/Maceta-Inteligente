import 'package:flutter/material.dart';

enum FlowerStatusEnum {
  zero,
  inactive,
  good,
  inDanger,
  criticCondition,
}

extension FlowerStatusExtension on FlowerStatusEnum {
  Color get color {
    switch (this) {
      case FlowerStatusEnum.zero:
        return Colors.grey;
      case FlowerStatusEnum.inactive:
        return Colors.blueGrey;
      case FlowerStatusEnum.good:
        return Colors.green;
      case FlowerStatusEnum.inDanger:
        return Colors.orange;
      case FlowerStatusEnum.criticCondition:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  String get title {
    switch (this) {
      case FlowerStatusEnum.zero:
        return "No Registrado";
      case FlowerStatusEnum.inactive:
        return "Inactivo";
      case FlowerStatusEnum.good:
        return "Buen Estado";
      case FlowerStatusEnum.inDanger:
        return "En Peligro";
      case FlowerStatusEnum.criticCondition:
        return "Condición Crítica";
      default:
        return "Desconocido";
    }
  }
}
