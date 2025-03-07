import 'dart:convert';

import 'package:com.fahruazzuhd.newsapp/common/network/dio_exceptions.dart';
import 'package:dio/dio.dart';

abstract mixin class ApiBase {
  Future<bool> _requestMethodTemplate(
      Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode == 200) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  //Generic method template for create item on server
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for update item on server
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for delete item from server
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //get request
  Future<List<T>> makeGetRequest<T>(
    Future<Response<dynamic>> apiCallback,
    T Function(Map<String, dynamic>) getJsonCallback,
  ) async {
    try {
      final Response response = await apiCallback;

      if (response.statusCode == 200) {
        // Pastikan response.data adalah Map dan memiliki key yang berisi list
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('articles')) {
          final List<dynamic> articlesJson = response.data['articles'];

          // Konversi setiap elemen dari JSON ke model yang diinginkan
          return articlesJson
              .map((item) => getJsonCallback(item as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception("Invalid response format: Missing 'articles' key.");
        }
      } else {
        throw Exception(
            "API request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<T> makeGetObjectRequest<T>(
    Future<Response<dynamic>> apiCallback,
    T Function(Map<String, dynamic> json) getJsonCallback,
  ) async {
    final Response response = await apiCallback;

    if (response.statusCode == 200) {
      return getJsonCallback(json.decode(json.encode(response.data)));
    } else {
      throw DioExceptions;
    }
  }
}
