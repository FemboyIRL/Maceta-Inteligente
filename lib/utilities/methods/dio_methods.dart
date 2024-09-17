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
            ///IGNORE
          }
        }
        throw "${dioException.response!.statusMessage}\n${getErrorFromServer(dioException.response!)}";
      }

      if (dioException.error is SocketException) {
        throw 'connectionErrorMessage';
      } else if (dioException.type == DioExceptionType.cancel) {
        throw 'processWasCanceled';
      } else if (dioException.type == DioExceptionType.connectionTimeout) {
        throw 'weCouldNotConnectToTheServer';
      }

      throw Exception(dioException.message);
    }
  }

  static Future<String> getErrorFromServer(
      final Response<dynamic> response) async {
    try {
      if (response.statusCode! >= 500 && response.statusCode! < 600) {
        return "internalServerError(${response.statusCode})";
      }

      if (response.data == null) {
        throw 'Translates.myLanguage.noInformationReceived';
      }

      if (response.data is Map) {
        return "${_getListServerErrors(Map<String, dynamic>.from(response.data))}${'Translates.myLanguage.errorCode'}: ${response.statusCode}";
      }

      if (response.data is List) {
        return "${response.data.join('\n')} Error: ${response.statusCode}";
      }

      if (response.data is String && response.data.contains("<html>")) {
        return "dataNotFound (${response.statusCode})";
      }

      throw response.data;
    } catch (error) {
      return error.toString();
    }
  }

  ///This function is just for foreach the data in the error list
  static String _getListServerErrors(final Map<String, dynamic> errors) {
    String error = "";
    for (var key in errors.keys) {
      error += "$key: ${errors[key]}\n";
    }
    return error;
  }
}