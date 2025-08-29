import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:infrastructure/core/network/client/connection_checker.dart';
import 'package:infrastructure/core/network/errors/exceptions.dart';
import 'package:infrastructure/core/network/errors/extensions/dio_exception_extension.dart';

class ApiClient {
  final Dio _dio;
  final ConnectionChecker _connectionChecker;

  ApiClient({
    required Dio dio,
    required ConnectionChecker connectionChecker,
  })  : _dio = dio,
        _connectionChecker = connectionChecker;

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    return _request(() => _dio.get(endpoint, queryParameters: queryParams));
  }

  Future<dynamic> post(String endpoint, {dynamic data}) async {
    return _request(() => _dio.post(endpoint, data: data));
  }

  Future<dynamic> put(String endpoint, {dynamic data}) async {
    return _request(() => _dio.put(endpoint, data: data));
  }

  Future<dynamic> delete(String endpoint) async {
    return _request(() => _dio.delete(endpoint));
  }

  Future<dynamic> _request(Future<Response> Function() request) async {
    if (!await _connectionChecker.hasConnection) {
      throw NoConnectionException();
    }
    try {
      final response = await request();

      final data = response.data;
      if (data is String) {
        return jsonDecode(data);
      }
      return data;
    } on DioException catch (e) {
      throw e.toAppException();
    }
  }
}
