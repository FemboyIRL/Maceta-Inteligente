import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/flowerpot_alerts/server_model/server_model.dart';
import 'package:maceta_inteligente/models/flowerpot_configs/server_model/server_model.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/plant/server_model.dart/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/models/user_model.dart';
import 'package:maceta_inteligente/utilities/methods/shared_preferences_methods.dart';
import 'dio_methods.dart';

class HttpDioRequests {
  final Dio _dio;
  String? _token;

  HttpDioRequests()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://192.168.56.1:8000',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  Future<void> initialize() async {
    _token = await SharedPreferencesMethods.getUserToken();
  }

  String? get token => _token;

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    const String endpoint = '/api/users/login/';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.post(
          endpoint,
          data: {
            'username': username,
            'password': password,
          },
        ),
        urlPath: endpoint,
      );

      if (response.data != null) {
        return response.data!;
      } else {
        throw Exception('Error en el inicio de sesión: Datos vacíos.');
      }
    } catch (e) {
      print('Error al intentar loguearse: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> registerUser(
      String username, String email, String password) async {
    const String endpoint = '/api/users/register/';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.post(
          endpoint,
          data: {
            'username': username,
            'email': email,
            'password': password,
          },
        ),
        urlPath: endpoint,
      );

      if (response.data != null) {
        return response.data!;
      } else {
        throw Exception('Error en el registro: Datos vacíos.');
      }
    } catch (e) {
      print('Error al intentar registrarse: $e');
      rethrow;
    }
  }

  Future<List<Smartpot>> getUserSmartpots() async {
    const String endpoint = '/api/smartpots/';

    try {
      final response = await DioMethods.validateRequest<List<dynamic>>(
        _dio.get(
          endpoint,
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return response.data!.map((e) => Smartpot.fromServer(e)).toList();
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al obtener las macetas: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<List<Plant>> getPlants() async {
    const String endpoint = '/api/plants';

    try {
      final response = await DioMethods.validateRequest<List<dynamic>>(
        _dio.get(
          endpoint,
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return response.data!.map((e) => Plant.fromServer(e)).toList();
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al obtener las macetas: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<List<FlowerpotSensor>> getUserSmartpotSensors(String id) async {
    final String endpoint = '/api/smartpots/$id/sensors';

    try {
      final response = await DioMethods.validateRequest<List<dynamic>>(
        _dio.get(
          endpoint,
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return response.data!
          .map((e) => FlowerpotSensor.fromMapServer(e))
          .toList();
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            content: Text('Error al obtener las sensores de la maceta: $id')),
      );
      print(e);
      rethrow;
    }
  }

  Future<Smartpot> createSmartpot(Smartpot smartpot) async {
    const String endpoint = '/api/smartpots/create/';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.post(
          endpoint,
          data: smartpot.toJson(),
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return Smartpot.fromServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al crear la maceta: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<Smartpot> getSmartpotById(String id) async {
    final String endpoint = '/api/smartpots/$id';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.get(endpoint),
        urlPath: endpoint,
      );

      return Smartpot.fromServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al obtener el Smartpot: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<List<FlowerpotAlert>> getSmartpotAlerts(String smartpotId) async {
    final String endpoint = '/api/smartpots/$smartpotId/alerts/';

    try {
      final response = await DioMethods.validateRequest<List<dynamic>>(
        _dio.get(
          endpoint,
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return response.data!
          .map((e) => FlowerpotAlert.fromMapServer(e))
          .toList();
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al obtener las alertas: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<List<FlowerpotAlert>> getSmartpotWaterEvents(String smartpotId) async {
    final String endpoint = '/api/smartpots/$smartpotId/watering/';

    try {
      final response = await DioMethods.validateRequest<List<dynamic>>(
        _dio.get(
          endpoint,
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return response.data!
          .map((e) => FlowerpotAlert.fromMapServer(e))
          .toList();
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al obtener los eventos de riego: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<FlowerpotConfigs> updateSmartpotConfigurations(
      String smartpotId, FlowerpotConfigs configurations) async {
    final String endpoint = '/api/smartpots/$smartpotId/configurations/';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.put(
          endpoint,
          data: configurations.toJson(),
        ),
        urlPath: endpoint,
      );

      return FlowerpotConfigs.fromMapServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al actualizar la configuración: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<FlowerpotConfigs> getSmartpotConfig(String id) async {
    final String endpoint = '/api/smartpots/$id/configurations/';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.get(
          endpoint,
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ),
        ),
        urlPath: endpoint,
      );

      return FlowerpotConfigs.fromMapServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            content:
                Text('Error al obtener las configuraciones de la maceta: $e')),
      );
      print(e);
      rethrow;
    }
  }
}
