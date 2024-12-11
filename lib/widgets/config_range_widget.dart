import 'package:flutter/material.dart';

class ConfigRangeDisplay extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final String label;
  final Function(BuildContext, double, String) onMaxValueTap;
  final Function(BuildContext, double, String) onMinValueTap;

  const ConfigRangeDisplay({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.label,
    required this.onMinValueTap,
    required this.onMaxValueTap,
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
                  GestureDetector(
                    onTap: () => onMinValueTap(context, minValue, label),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        minValue.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: currentValue,
                      min: minValue,
                      max: maxValue,
                      onChanged: null,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.withOpacity(0.3),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onMaxValueTap(context, maxValue, label),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.brown[800],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        maxValue.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
