import 'package:dio/dio.dart';
import 'package:infrastructure/core/errors/exceptions.dart';
import 'package:infrastructure/core/errors/extensions/dio_exception_extension.dart';
import 'package:infrastructure/core/network/network_info.dart';

class ApiClient {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  ApiClient({
    required Dio dio,
    required NetworkInfo networkInfo,
  })  : _dio = dio,
        _networkInfo = networkInfo;

  Future<Response<T>> get<T>(String endpoint) async {
    return _request<T>(() => _dio.get(endpoint));
  }

  Future<Response<T>> post<T>(String endpoint, {dynamic data}) async {
    return _request<T>(() => _dio.post(endpoint, data: data));
  }

  Future<Response<T>> put<T>(String endpoint, {dynamic data}) async {
    return _request<T>(() => _dio.put(endpoint, data: data));
  }

  Future<Response<T>> delete<T>(String endpoint) async {
    return _request<T>(() => _dio.delete(endpoint));
  }

  Future<Response<T>> _request<T>(
      Future<Response<T>> Function() request) async {
    if (!await _networkInfo.isConnected) {
      throw NoConnectionException();
    }
    try {
      return await request();
    } on DioException catch (e) {
      throw e.toAppException();
    }
  }
}
