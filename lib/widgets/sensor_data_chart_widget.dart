import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:intl/intl.dart';

class SensorDataChart extends StatelessWidget {
  final List<FlowerpotSensor> sensorData;

  const SensorDataChart({super.key, required this.sensorData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                if (value.toInt() % 2 == 0 &&
                    value.toInt() < sensorData.length) {
                  final date = sensorData[value.toInt()].registerDateTime;
                  String formattedDate = DateFormat('dd/MM')
                      .format(date); 
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0), 
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return const SizedBox(); 
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: sensorData.length.toDouble() - 1,
        minY: 0,
        maxY: 100, 
        lineBarsData: [
          LineChartBarData(
            spots: sensorData.asMap().entries.map((entry) {
              int index = entry.key;
              FlowerpotSensor sensor = entry.value;
              return FlSpot(index.toDouble(),
                  sensor.humidity);
            }).toList(),
            isCurved: true,
            color: Colors.blue,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(show: true),
          ),
        ],
      ),
    );
  }
}
