import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/MainMenuScreen/state.dart';
import 'package:maceta_inteligente/utilities/delegates/header_child_sliver_list.dart';
import 'package:maceta_inteligente/utilities/methods/global_methods.dart';
import 'package:maceta_inteligente/widgets/common_scaffold.dart';
import 'package:maceta_inteligente/widgets/last_card_add_widget.dart';
import 'package:maceta_inteligente/widgets/my_flowerpot_widget.dart';
import 'package:maceta_inteligente/widgets/weather_condition_widget.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  Widget _persistentSearchBar(final MainMenuState state) {
    return SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: HeaderChildSliverList(
            maxSize: 60,
            minSize: 60,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: SearchBar(
                    onChanged: state.onSearchUpdated,
                    hintText: 'Buscar maceta',
                    trailing: const [Icon(Icons.search, size: 35)]))));
  }

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

  Widget _flowerpotOverview(BuildContext context, MainMenuState state) {
    final filteredList = state.filteredOperations();
    print(filteredList);

    if (filteredList.isEmpty) {
      return SizedBox(
        width: 150,
        height: 270,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LastCardAddWidget(
                name: 'maceta', onTap: () => state.handleOnTapAdd(context)),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: filteredList.length + 1,
            itemBuilder: (context, index) {
              if (index == filteredList.length) {
                return LastCardAddWidget(
                  name: "maceta",
                  onTap: () => state.handleOnTapAdd(context),
                );
              } else {
                final Smartpot item =
                    state.myFlowerPots[index];
                return MyFlowerpotWidget(flowerPot: item);
              }
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainMenuState>(
        init: MainMenuState(),
        builder: (state) => CommonScaffold(
              sliversChildren: [
                SliverPadding(
                    padding: const EdgeInsets.all(10),
                    sliver: _persistentSearchBar(state)),
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
                ValueListenableBuilder<String>(
                  valueListenable: state.searchValue,
                  builder: (context, value, child) => SliverToBoxAdapter(
                      child: _flowerpotOverview(context, state)),
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
