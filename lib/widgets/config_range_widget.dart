import 'package:flutter/material.dart';

class ConfigRangeDisplay extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final String label;

  const ConfigRangeDisplay({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    minValue.toStringAsFixed(1),
                    style: TextStyle(fontSize: 14, color: Colors.green[600]),
                  ),
                  Expanded(
                    child: Slider(
                      value: currentValue,
                      min: minValue,
                      max: maxValue,
                      onChanged: null,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.withOpacity(
                          0.3), 
                    ),
                  ),
                  Text(
                    maxValue.toStringAsFixed(1),
                    style: TextStyle(fontSize: 14, color: Colors.green[600]),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Valor actual: ${currentValue.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
