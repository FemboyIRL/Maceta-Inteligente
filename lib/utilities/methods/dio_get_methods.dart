import 'dart:io';
import 'package:dio/dio.dart';
import 'package:maceta_inteligente/models/plant_data/server/server_model.dart';
import 'package:maceta_inteligente/utilities/methods/dio_methods.dart';

abstract class DioGetMethods {
  static Future<List<Plant>> getPlantList() async {
    const String key = "sk-SkjK66e0e52064b0c6802";
    String url = 'https://perenual.com/api/species-list?key=$key&page=1';
    try {
      final dio = Dio()
        ..options.connectTimeout = const Duration(seconds: 10)
        ..options.receiveTimeout = const Duration(seconds: 60)
        ..options.validateStatus = (status) => (status == HttpStatus.ok);
      final response = await DioMethods.validateRequest(
        dio.get(url,
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
              HttpHeaders.acceptHeader: 'application/json',
            })),
        urlPath: url,
      );

      print(response);

      if (response.data != null && response.data is Map<String, dynamic>) {
        final jsonResponse = response.data as Map<String, dynamic>;

        if (jsonResponse.containsKey('data') && jsonResponse['data'] != null) {
          final List<dynamic> data = jsonResponse['data'];

          List<Plant> plants = data.map((plantJson) {
            return Plant.fromJson(plantJson);
          }).toList();

          return plants;
        } else {
          print('La clave "data" es null o no existe en la respuesta');
          return [];
        }
      } else {
        print('La respuesta no es un Map válido o es null');
        return [];
      }
    } catch (e) {
      print('Error $e');
      return [];
    }
  }
}
