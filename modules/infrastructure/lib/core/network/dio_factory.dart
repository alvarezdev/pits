import 'package:dio/dio.dart';
import 'package:infrastructure/core/constants/app_constants.dart';
import 'package:infrastructure/core/network/interceptors/auth_interceptor.dart';

class DioFactory {
  final AuthInterceptor _authInterceptor;

  DioFactory({required AuthInterceptor authInterceptor})
      : _authInterceptor = authInterceptor;

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        contentType: AppConstants.contentType,
        connectTimeout: const Duration(seconds: AppConstants.connectTimeout),
        receiveTimeout: const Duration(seconds: AppConstants.receiveTimeout),
      ),
    );

    dio.interceptors.addAll([
      _authInterceptor,
      LogInterceptor(responseBody: true),
    ]);

    return dio;
  }
}
