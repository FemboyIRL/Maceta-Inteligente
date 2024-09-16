import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogoPlantasEstado extends GetxController {
  final searchValue = ValueNotifier<String>("");
  void onSearchUpdated(final String newValue) => searchValue.value = newValue;
}
