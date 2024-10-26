import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/PantallaMenuPrincipal/state.dart';
import 'package:maceta_inteligente/utilities/methods/global_methods.dart';
import 'package:maceta_inteligente/widgets/common_scaffold.dart';
import 'package:maceta_inteligente/widgets/last_card_add_widget.dart';
import 'package:maceta_inteligente/widgets/my_flowerpot_widget.dart';
import 'package:maceta_inteligente/widgets/weather_condition_widget.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  Widget _weatherConditionsWidget(MainMenuState state) {
    return WeatherConditionWidget(
      place: state.place.value,
      condition: state.condition.value,
      humidity: state.humidity.value,
      temperature: state.temperature.value,
      windSpeed: state.windSpeed.value,
      thermalSensation: state.thermalSensation.value,
      lastDateRegistered: state.lastDateRegistered.value,
      weatherIcon: GlobalMethods.getWeatherIconFuture(state.weatherIcon),
    );
  }

  Widget _myFlowerpots(MainMenuState state) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.myFlowerPots.length + 1,
        itemBuilder: (context, index) {
          if (index == state.myFlowerPots.length) {
            return LastCardAddWidget(name: "maceta", onTap: () {});
          } else {
            final MyFlowerpotModel item = state.myFlowerPots[index];
            return MyFlowerpotWidget(
              flowerPot: item,
            );
          }
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainMenuState>(
        init: MainMenuState(),
        builder: (state) => CommonScaffold(
              sliversChildren: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Mis macetas",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _myFlowerpots(state),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _weatherConditionsWidget(state),
                ))
              ],
            ));
  }
}
