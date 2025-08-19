import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infrastructure/core/constants/app_constants.dart';
import 'package:infrastructure/core/network/interceptors/auth_interceptor.dart';

Dio provideDio(FlutterSecureStorage storage) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl,
    contentType: AppConstants.contentType,
    connectTimeout: const Duration(seconds: AppConstants.connectTimeout),
    receiveTimeout: const Duration(seconds: AppConstants.receiveTimeout),
  ));

  dio.interceptors.addAll([
    AuthInterceptor(storage),
    LogInterceptor(responseBody: true), 
  ]);

  return dio;
}