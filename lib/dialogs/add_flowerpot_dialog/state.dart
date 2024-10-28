import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddFlowerpotDialogState extends GetxController {
  var serialNumber = ''.obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;


  void updateSerialNumber(String value) {
    serialNumber.value = value;
  }

  void addFlowerpot() {
   
  }

  void handleClose(BuildContext context){
    Navigator.of(context).pop();
  }


  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) async {
      updateSerialNumber(scanData.code ?? '');
      await handlePetitionToServer();
    });
  }

  Future<void> handlePetitionToServer() async {

  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
