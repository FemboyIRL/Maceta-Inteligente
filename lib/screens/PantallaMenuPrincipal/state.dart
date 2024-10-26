import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/dialogs/add_flowerpot_dialog/screen.dart';
import 'package:maceta_inteligente/utilities/methods/geo_locator_methods.dart';
import 'package:maceta_inteligente/utilities/methods/global_methods.dart';
import 'package:maceta_inteligente/utilities/methods/shared_preferences_methods.dart';
import 'package:weather/weather.dart';

class MainMenuState extends GetxController {
  late WeatherFactory _wf;
  Weather? _weather;
  final place = ''.obs;
  final condition = ''.obs;
  final humidity = 0.0.obs;
  final temperature = 0.0.obs;
  final windSpeed = 0.0.obs;
  final thermalSensation = 0.0.obs;
  final lastDateRegistered = ''.obs;
  final weatherIcon = ''.obs;

  List<MyFlowerpotModel> myFlowerPots = [
    MyFlowerpotModel(
      id: 1,
      userID: 1,
      plantName: 'Aloe Vera',
      potName: 'Pot 1',
      location: 'Living Room',
      lastUpdated: DateTime.now(),
    ),
    MyFlowerpotModel(
      id: 2,
      userID: 1,
      plantName: 'Succulent',
      potName: 'Pot 2',
      location: 'Bedroom',
      lastUpdated: DateTime.now().subtract(Duration(days: 1)),
    ),
    MyFlowerpotModel(
      id: 3,
      userID: 2,
      plantName: 'Basil',
      potName: 'Pot 3',
      location: 'Kitchen',
      lastUpdated: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  @override
  void onInit() async {
    super.onInit();
    GeoLocatorMethod.determinePosition();
    GeoLocatorMethod.getLocation();

    Locale locale = Localizations.localeOf(Get.context!);
    String languageCode = locale.languageCode;

    _wf = WeatherFactory(
      '0d94f5a9bc37ae2f8f2014218fa6d085',
      language: languageCode == 'en' ? Language.ENGLISH : Language.SPANISH,
    );
    _weatherWidget();
    update();
  }

  void handleOnTapAdd(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => const AddFlowerpotDialog());
  }

  void _weatherWidget() async {
    final userLocation = await SharedPreferencesMethods.getUserLocation();
    if (userLocation != null) {
      _weather = await _wf.currentWeatherByLocation(
          userLocation.latitude, userLocation.longitude);
    }
    _setWeatherWidget();

    update();
  }

  void _setWeatherWidget() {
    if (_weather == null) {
      return;
    } else {
      place.value = _weather!.areaName ?? "";
      condition.value = _weather!.weatherDescription ?? '';
      humidity.value = _weather!.humidity ?? 0.0;
      temperature.value =
          double.parse(_weather!.temperature!.celsius!.toStringAsFixed(2));
      windSpeed.value = _weather!.windSpeed ?? 0.0;
      thermalSensation.value =
          double.parse(_weather!.tempFeelsLike!.celsius!.toStringAsFixed(2));
      lastDateRegistered.value =
          GlobalMethods.formatWeatherDate(_weather!.date!);
      weatherIcon.value = _weather!.weatherIcon ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    place.close();
    condition.close();
    humidity.close();
    temperature.close();
    windSpeed.close();
    thermalSensation.close();
    lastDateRegistered.close();
    weatherIcon.close();
  }
}

class MyFlowerpotModel {
  final int id;
  final int userID;
  final String plantName;
  final String potName;
  final String location;
  final DateTime lastUpdated;

  const MyFlowerpotModel(
      {required this.id,
      required this.userID,
      required this.plantName,
      required this.potName,
      required this.location,
      required this.lastUpdated});
}
