import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'dio_methods.dart';

class HttpDioRequests {
  final Dio _dio;

  HttpDioRequests()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:3000',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

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
