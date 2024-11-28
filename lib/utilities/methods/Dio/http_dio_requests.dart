import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/models/user_model.dart';
import 'dio_methods.dart';

class HttpDioRequests {
  final Dio _dio;

  HttpDioRequests()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.56.1:8000',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );
  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    const String endpoint = '/api/users/login/';

    try {
      final response = await _dio.post(endpoint, data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error en el inicio de sesión: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al intentar loguearse: $e');
      rethrow;
    }
  }

  Future<User> updateUser(String id, User user) async {
    final String endpoint = '/users/$id';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.put(
          endpoint,
          data: user.toMap(),
        ),
        urlPath: endpoint,
      );

      return User.fromServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al actualizar el usuario: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<Smartpot> createSmartpot(Smartpot smartpot) async {
    const String endpoint = '/smartpots';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.post(
          endpoint,
          data: smartpot.toJson(),
        ),
        urlPath: endpoint,
      );

      return Smartpot.fromServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al crear el Smartpot: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<Smartpot> updateSmartpot(String id, Smartpot smartpot) async {
    final String endpoint = '/smartpots/$id';

    try {
      final response = await DioMethods.validateRequest<Map<String, dynamic>>(
        _dio.put(
          endpoint,
          data: smartpot.toJson(),
        ),
        urlPath: endpoint,
      );

      return Smartpot.fromServer(response.data!);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error al actualizar el Smartpot: $e')),
      );
      print(e);
      rethrow;
    }
  }

  Future<List<Smartpot>> getAllSmartpots() async {
    const String endpoint = '/smartpots';

    try {
      final response = await DioMethods.validateRequest<List>(
        _dio.get(endpoint),
        urlPath: endpoint,
      );

      return response.data!
          .map((json) => Smartpot.fromServer(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content:
              Text('Error al obtener la lista de macetas inteligentes: $e')));
      print(e);
      rethrow;
    }
  }

  Future<Smartpot> getSmartpotById(String id) async {
    final String endpoint = '/smartpots/$id';

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
}
