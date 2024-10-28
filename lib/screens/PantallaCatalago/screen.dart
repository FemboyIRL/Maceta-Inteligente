import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/PantallaCatalago/state.dart';
import 'package:maceta_inteligente/utilities/delegates/header_child_sliver_list.dart';
import 'package:maceta_inteligente/widgets/planta_catalogo_widget.dart';

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

  Widget _operationsWidget(
      {required final BuildContext context,
      required final CatalogoPlantasEstado state}) {
    final filteredList = state.filteredOperations();
    if (filteredList.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return SliverList.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) => (item) {
              return PlantaCatalogoWidget(
                planta: item,
              );
            }(filteredList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogoPlantasEstado>(
      init: CatalogoPlantasEstado(),
      builder: (state) => Scaffold(
        appBar: AppBar(
          title: const Text('Catalogo de plantas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              _persistentSearchBar(state),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    'Todas las plantas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              ValueListenableBuilder<String>(
                  valueListenable: state.searchValue,
                  builder: (context, value, child) =>
                      _operationsWidget(context: context, state: state)),
            ],
          ),
        ),
      ),
    );
  }
}
