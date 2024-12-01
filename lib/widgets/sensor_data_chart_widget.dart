import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maceta_inteligente/screens/SensorChartsScreen/state.dart'; // Para formatear fechas

class SensorLineChart extends StatefulWidget {
  final List<SensorHistory> sensorData;
  const SensorLineChart({Key? key, required this.sensorData}) : super(key: key);

  @override
  _SensorLineChartState createState() => _SensorLineChartState();
}

class _SensorLineChartState extends State<SensorLineChart> {
  bool isShowingMainData = true;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 37),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: _LineChart(
                      isShowingMainData: isShowingMainData,
                      sensorData: widget.sensorData),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
            ),
            onPressed: () {
              setState(() {
                isShowingMainData = !isShowingMainData;
              });
            },
          )
        ],
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData, required this.sensorData});

  final bool isShowingMainData;
  final List<SensorHistory> sensorData;

  @override
  Widget build(BuildContext context) {
    if (sensorData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return LineChart(
      isShowingMainData ? sampleData1() : sampleData2(),
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: lineTouchData1(),
      gridData: gridData,
      titlesData: titlesData1(),
      borderData: borderData,
      lineBarsData: lineBarsData1(),
      minX: 0,
      maxX: sensorData.length.toDouble(),
      maxY: sensorData.map((e) => e.value).reduce((a, b) => a > b ? a : b),
      minY: sensorData.map((e) => e.value).reduce((a, b) => a < b ? a : b),
    );
  }

  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: lineTouchData2(),
      gridData: gridData,
      titlesData: titlesData2(),
      borderData: borderData,
      lineBarsData: lineBarsData2(),
      minX: 0,
      maxX: sensorData.length.toDouble(),
      maxY: sensorData.map((e) => e.value).reduce((a, b) => a > b ? a : b),
      minY: sensorData.map((e) => e.value).reduce((a, b) => a < b ? a : b),
    );
  }

  LineTouchData lineTouchData1() {
    return LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
      ),
    );
  }

  FlTitlesData titlesData1() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles(),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      ),
    );
  }

  List<LineChartBarData> lineBarsData1() {
    return [
      LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: sensorData
            .map((e) => FlSpot(sensorData.indexOf(e).toDouble(), e.value))
            .toList(),
      ),
    ];
  }

  LineTouchData lineTouchData2() {
    return const LineTouchData(
      enabled: false,
    );
  }

  FlTitlesData titlesData2() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles(),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      ),
    );
  }

  List<LineChartBarData> lineBarsData2() {
    return [
      LineChartBarData(
        isCurved: true,
        color: Colors.blue.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: sensorData
            .map((e) => FlSpot(sensorData.indexOf(e).toDouble(), e.value))
            .toList(),
      ),
    ];
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() {
    return SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final int index = value.toInt();

    if (index < sensorData.length) {
      final DateTime date = sensorData[index].registerDateTime;
      final String formattedDate = DateFormat('dd/MM').format(date);

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: Text(formattedDate,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
      );
    } else {
      return const SizedBox();
    }
  }

  SideTitles bottomTitles() {
    return SideTitles(
      showTitles: true,
      reservedSize: 32,
      interval: 1,
      getTitlesWidget: bottomTitleWidgets,
    );
  }

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.blue.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
}
