import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';
import 'package:maceta_inteligente/screens/FlowerPotDetailsScreen/screen.dart';
import 'package:maceta_inteligente/screens/FlowerPotScreen/state.dart';
import 'package:maceta_inteligente/screens/FlowerpotAlertsScreen/screen.dart';
import 'package:maceta_inteligente/screens/FlowerpotConfigScreen/screen.dart';
import 'package:maceta_inteligente/widgets/common_scaffold.dart';

class FlowerpotScreen extends StatelessWidget {
  final MyFlowerpotOperationalModel flowerPot;

  const FlowerpotScreen({super.key, required this.flowerPot});

  Widget _navigationPanel(BuildContext context, FlowerpotState state) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          state.navigationCards.length,
          (index) => _buildCard(context, index, state),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index, FlowerpotState state) {
    NavigationPanelOperationalModel card = state.navigationCards[index];
    return Obx(() => GestureDetector(
          onTap: () {
            state.selectedCardIndex.value = index;
            state.pageController.jumpToPage(index);
          },
          child: Card(
            color: state.selectedCardIndex.value == index
                ? Colors.green
                : Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: 100,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      card.icon,
                      color: state.selectedCardIndex.value == index
                          ? Colors.white
                          : Colors.green,
                      size: 22,
                    ),
                    Expanded(
                      child: Text(
                        card.title,
                        style: TextStyle(
                          color: state.selectedCardIndex.value == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _contentPanel(
      FlowerpotState state, MyFlowerpotOperationalModel flowerPot) {
    return PageView(
      controller: state.pageController,
      onPageChanged: (index) {
        state.selectedCardIndex.value = index;
      },
      children: [
        FlowerpotDetailsScreen(
          flowerPot: flowerPot,
        ),
        FlowerpotAlertsScreen(
          flowerPot: flowerPot,
        ),
        FlowerpotConfigScreen(
          flowerPot: flowerPot,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowerpotState>(
      init: FlowerpotState(flowerPot: flowerPot),
      builder: (state) => CommonScaffold(
        sliversChildren: [
          SliverToBoxAdapter(child: _navigationPanel(context, state)),
          SliverToBoxAdapter(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: _contentPanel(state, flowerPot)),
          )
        ],
      ),
    );
  }
}

class FlowerpotConfigurationsScreen {}
