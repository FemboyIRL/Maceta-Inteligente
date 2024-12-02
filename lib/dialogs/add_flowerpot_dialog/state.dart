import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/flower_status_enum.dart';
import 'package:maceta_inteligente/models/plant/server_model.dart/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddFlowerpotDialogState extends GetxController {
  var serialNumber = ''.obs;
  var potName = ''.obs;
  var ubication = ''.obs;
  Plant? selectedPlant;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  List<Plant> plants = [];
  QRViewController? qrController;

  @override
  void onInit() async {
    super.onInit();

    var dio = HttpDioRequests();
    await dio.initialize();
    plants = await dio.getPlants();
    update();
  }

  void updateSerialNumber(String value) {
    serialNumber.value = value;
  }

  void updatePotName(String value) {
    potName.value = value;
  }

  void updateUbication(String value) {
    ubication.value = value;
  }

  void updateSelectedPlant(Plant? value) {
    selectedPlant = value;
    update();
  }

  Future<void> handleAddFlowerpot() async {
    if (serialNumber.value.isEmpty ||
        potName.value.isEmpty ||
        ubication.value.isEmpty ||
        selectedPlant == null) {
      Get.snackbar("Error", "Por favor complete todos los campos.");
      return;
    }

    try {
      Smartpot newSmartpot = Smartpot(
        id: 0,
        serialNumber: serialNumber.value,
        potName: potName.value,
        ubication: ubication.value,
        updatedAt: DateTime.now(),
        size: 'pequeña',
        status: FlowerStatusEnum.good,
        plant: selectedPlant,
      );

      var dio = HttpDioRequests();

      await dio.initialize();

      final response = await dio.createSmartpot(newSmartpot);

      if (response != null) {
        Get.snackbar(
          "Maceta Agregada",
          "La maceta se ha agregado correctamente.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Navigator.of(Get.context!).pop();
        plants = await dio.getPlants();
        update();
      } else {
        Get.snackbar(
          "Error",
          "Hubo un problema al agregar la maceta.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Manejo de errores en caso de fallos
      Get.snackbar(
        "Error",
        "Hubo un error al agregar la maceta.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error: $e");
    }
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) async {
      updateSerialNumber(scanData.code ?? '');
      await handlePetitionToServer();
    });
  }

  Future<void> handlePetitionToServer() async {
    await handleAddFlowerpot();
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
