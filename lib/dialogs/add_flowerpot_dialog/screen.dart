import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/dialogs/add_flowerpot_dialog/state.dart';
import 'package:maceta_inteligente/models/plant/server_model.dart/server_model.dart';
import 'package:maceta_inteligente/utilities/methods/dialogs_methods.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddFlowerpotDialog extends StatelessWidget {
  const AddFlowerpotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFlowerpotDialogState>(
      init: AddFlowerpotDialogState(),
      builder: (state) => WillPopScope(
        onWillPop: () async =>
            await DialogsMethods.dialogAskCloseWindow(context),
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Center(
            child: Text(
              "Agregar Nueva Maceta",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => print("Escanea el QR"),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[400]!, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: QRView(
                      key: state.qrKey,
                      onQRViewCreated: state.onQRViewCreated,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const ColoredBox(
                color: Colors.black,
                child: SizedBox(height: 3, width: double.infinity),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: state.updateSerialNumber,
                decoration: InputDecoration(
                  hintText: 'o puedes ingresar el número de serie',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<Plant?>(
                value: state.selectedPlant,
                decoration: InputDecoration(
                  labelText: 'Seleccionar Planta',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onChanged: (Plant? newValue) {
                  if (newValue != null) {
                    state.updateSelectedPlant(newValue);
                  }
                },
                items: state.plants.map((plant) {
                  return DropdownMenuItem<Plant?>(
                    value: plant,
                    child: Text(plant.plantName),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: state.updatePotName,
                decoration: InputDecoration(
                  hintText: 'Nombre de la maceta',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: state.updateUbication,
                decoration: InputDecoration(
                  hintText: 'Ubicación',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop,
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[600],
              ),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                state.handleAddFlowerpot();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:
                  const Text("Agregar", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
