//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/infrastructure.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:infrastructure/core/network/api_client.dart' as _i633;
import 'package:infrastructure/core/network/connection_checker.dart' as _i420;
import 'package:infrastructure/core/network/dio_factory.dart' as _i975;
import 'package:infrastructure/core/network/interceptors/auth_interceptor.dart'
    as _i1067;
import 'package:infrastructure/datasource/integration_external_datasource.dart'
    as _i594;
import 'package:infrastructure/module_register.dart' as _i604;
import 'package:infrastructure/repository/integration_external_repository_impl.dart'
    as _i894;
import 'package:injectable/injectable.dart' as _i526;

class InfrastructurePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i420.ConnectionChecker>(
        () => registerModule.connectionChecker);
    gh.lazySingleton<_i1067.AuthInterceptor>(
        () => registerModule.authInterceptor(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i975.DioFactory>(
        () => registerModule.dioFactory(gh<_i1067.AuthInterceptor>()));
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.dio(gh<_i975.DioFactory>()));
    gh.lazySingleton<_i633.ApiClient>(() => registerModule.apiClient(
          gh<_i361.Dio>(),
          gh<_i420.ConnectionChecker>(),
        ));
    gh.factory<_i594.IntegrationExternalDatasource>(() =>
        _i594.IntegrationExternalDatasource(apiClient: gh<_i633.ApiClient>()));
    gh.lazySingleton<_i494.IntegrationExternalRepository>(() =>
        _i894.IntegrationExternalRepositoryImpl(
            gh<_i594.IntegrationExternalDatasource>()));
  }
}

class _$RegisterModule extends _i604.RegisterModule {}
