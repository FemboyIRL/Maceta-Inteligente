import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

abstract class DioMethods {
  static Future<Response<T>> validateRequest<T>(
      Future<Response<T>> requestPetition,
      {required final String urlPath}) async {
    try {
      return await requestPetition;
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response?.data is Uint8List) {
          dioException.response?.data =
              utf8.decode(dioException.response!.data);

          try {
            dioException.response!.data =
                json.decode(dioException.response!.data);
          } catch (error) {
            ///IGNORAR
          }
        }
        throw "${dioException.response!.statusMessage}\n${getErrorFromServer(dioException.response!)}";
      }

      if (dioException.error is SocketException) {
        throw 'No se pudo establecer conexión con el servidor.';
      } else if (dioException.type == DioExceptionType.cancel) {
        throw 'El proceso fue cancelado.';
      } else if (dioException.type == DioExceptionType.connectionTimeout) {
        throw 'No se pudo conectar al servidor a tiempo.';
      }

      throw Exception(dioException.message);
    }
  }

  static Future<String> getErrorFromServer(
      final Response<dynamic> response) async {
    try {
      if (response.statusCode! >= 500 && response.statusCode! < 600) {
        return "Error interno del servidor (${response.statusCode})";
      }

      if (response.data == null) {
        throw 'No se recibió información del servidor.';
      }

      if (response.data is Map) {
        return "${_getListServerErrors(Map<String, dynamic>.from(response.data))}Código de error: ${response.statusCode}";
      }

      if (response.data is List) {
        return "${response.data.join('\n')} Error: ${response.statusCode}";
      }

      if (response.data is String && response.data.contains("<html>")) {
        return "Datos no encontrados (${response.statusCode})";
      }

      throw response.data;
    } catch (error) {
      return error.toString();
    }
  }

  /// Recorre los datos de la lista de errores y los formatea
  static String _getListServerErrors(final Map<String, dynamic> errors) {
    String error = "";
    for (var key in errors.keys) {
      error += "$key: ${errors[key]}\n";
    }
    return error;
  }
}
