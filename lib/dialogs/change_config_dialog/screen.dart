import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/dialogs/change_config_dialog/state.dart';

class ChangeConfigDialog extends StatelessWidget {
  final double currentValue;
  final String label; // Recibir el label como parámetro

  const ChangeConfigDialog(
      {super.key, required this.currentValue, required this.label});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeConfigDialogState>(
      init: ChangeConfigDialogState(value: currentValue, label: label),
      builder: (state) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, [state.value, state.label]);
          return true;
        },
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => state.incrementValue(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                state.value.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => state.decrementValue(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.arrow_downward, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
