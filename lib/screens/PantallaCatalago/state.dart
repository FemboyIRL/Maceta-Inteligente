import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/plant_data/server/server_model.dart';
import 'package:maceta_inteligente/utilities/methods/dio_get_methods.dart';

class CatalogoPlantasEstado extends GetxController {
  final searchValue = ValueNotifier<String>("");
  final List<Plant> plantList = [
    Plant(
      id: 30,
      nombreComun: "Ao Shime No Uchi Japanese Maple",
      nombreCientifico: ["Acer palmatum 'Ao Shime No Uchi'"],
      otrosNombres: [],
      ciclo: "Perennial",
      cantidadRiego: "Frequent",
      luzNecesaria: ["full sun", "part shade"],
      imagenPredeterminada: DefaultImage(
        licencia: 45,
        nombreLicencia: "Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)",
        urlLicencia: "https://creativecommons.org/licenses/by-sa/3.0/deed.en",
        urlOriginal:
            "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/og/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg",
        urlRegular:
            "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/regular/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg",
        urlMediana:
            "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/medium/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg",
        urlPequena:
            "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/small/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg",
        miniatura:
            "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/thumbnail/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg",
      ),
    ),
  ];

  @override
  void onInit() async {
    super.onInit();
    await _getPlantList();
  }

  List<Plant> filteredOperations() => plantList
      .where((item) => <bool>[
            item.nombreComun.toLowerCase().contains(searchValue.value.toLowerCase()),
            item.nombreCientifico
                    .contains(searchValue.value.toLowerCase()) ==
                true
          ].any((element) => element))
      .toList();

  Future<void> _getPlantList() async {
    final List<Plant> plantListFromServer = await DioGetMethods.getPlantList();
    plantList.addAll(plantListFromServer);
    print(plantList);
  }

  void onSearchUpdated(final String newValue) => searchValue.value = newValue;
}
