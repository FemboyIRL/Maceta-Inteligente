import 'package:flutter/material.dart';
import 'package:maceta_inteligente/models/sensor_card_operational_model.dart';
import 'package:maceta_inteligente/screens/SensorChartsScreen/screen.dart';

class SensorCardWidget extends StatelessWidget {
  final SensorCardOperationalModel operation;
  const SensorCardWidget({super.key, required this.operation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SensorDataScreen(sensor: operation))),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(operation.icon, size: 50, color: operation.color),
              const SizedBox(height: 8),
              Text(
                operation.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                operation.value,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
