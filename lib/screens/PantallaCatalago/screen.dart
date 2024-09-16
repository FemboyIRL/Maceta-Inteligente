import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/PantallaCatalago/state.dart';
import 'package:maceta_inteligente/utilities/delegates/header_child_sliver_list.dart';

class CatalogoPlantasPantalla extends StatelessWidget {
  const CatalogoPlantasPantalla({super.key});

  Widget _persistentSearchBar(final CatalogoPlantasEstado state) {
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
                    hintText: 'Buscar planta',
                    trailing: const [Icon(Icons.search, size: 35)]))));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogoPlantasEstado>(
      init: CatalogoPlantasEstado(),
      builder: (state) => Scaffold(
        body: CustomScrollView(
          slivers: [
            _persistentSearchBar(state),
          ],
        ),
      ),
    );
  }
}
