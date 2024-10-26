import 'package:flutter/material.dart';

class WeatherConditionWidget extends StatelessWidget {
  final String place;
  final String condition;
  final double humidity;
  final double temperature;
  final double windSpeed;
  final double thermalSensation;
  final String lastDateRegistered;
  final Future<String> weatherIcon;
  final Function(BuildContext)? onTapEnter;

  const WeatherConditionWidget({
    super.key,
    required this.place,
    required this.condition,
    required this.humidity,
    required this.temperature,
    required this.windSpeed,
    required this.thermalSensation,
    required this.lastDateRegistered,
    required this.weatherIcon,
    this.onTapEnter,
  });

  Widget _title() {
    return Row(children: [
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Text("Clima de hoy",
            style: TextStyle(fontSize: 12)),
        Row(
          children: [
            SizedBox(
                width: 170,
                child: Text(place,
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)))
          ],
        )
      ])),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox.square(
          dimension: 100,
          child: FutureBuilder<String>(
            future: weatherIcon,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://openweathermap.org/img/wn/${snapshot.data}@4x.png"),
                    ),
                  ),
                );
              } else {
                return const Icon(Icons.error);
              }
            },
          ),
        ),
      )
    ]);
  }

  Widget _wrapItems(
      {required final String title, required final String value}) {
    return SizedBox(
        width: 180,
        child:
            Text.rich(TextSpan(style: const TextStyle(fontSize: 11), children: [
          TextSpan(text: "$title: "),
          TextSpan(
              text: value, style: const TextStyle(fontWeight: FontWeight.bold))
        ])));
  }

  Widget _conditionsWrap() {
    return Wrap(
        runSpacing: 7,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          _wrapItems(title: 'Condicion', value: condition),
          _wrapItems(
              title: 'Humedad', value: "$humidity%"),
          _wrapItems(
              title: 'Temperatura',
              value: "$temperature°C"),
          _wrapItems(
              title: 'Velocidad del viento:',
              value: "${windSpeed}Km/h"),
          _wrapItems(
              title: "Sensación termica",
              value: "$thermalSensation°C"),
          _wrapItems(
              title: "Ultima fecha registrada",
              value: lastDateRegistered)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (onTapEnter == null) ? null : () => onTapEnter!(context),
      child: Card(
          elevation: 15,
          margin: EdgeInsets.zero,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [_title(), _conditionsWrap()]))),
    );
  }
}