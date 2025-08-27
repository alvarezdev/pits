import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infrastructure/core/network/api_client.dart';
import 'package:infrastructure/core/network/connection_checker.dart';
import 'package:infrastructure/core/network/dio_factory.dart';
import 'package:infrastructure/core/network/interceptors/auth_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  @lazySingleton
  AuthInterceptor authInterceptor(FlutterSecureStorage secureStorage) =>
      AuthInterceptor(secureStorage);

  @lazySingleton
  DioFactory dioFactory(AuthInterceptor authInterceptor) =>
      DioFactory(authInterceptor: authInterceptor);

  @lazySingleton
  Dio dio(DioFactory dioFactory) => dioFactory.create();
  
  @lazySingleton
  ConnectionChecker get connectionChecker => ConnectionChecker.create();

  @lazySingleton
  ApiClient apiClient(Dio dio, ConnectionChecker checker) =>
      ApiClient(dio: dio, connectionChecker: checker);
}
