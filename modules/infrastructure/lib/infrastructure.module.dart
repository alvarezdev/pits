//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/infrastructure.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:infrastructure/core/network/client/api_client.dart' as _i463;
import 'package:infrastructure/core/network/client/connection_checker.dart'
    as _i114;
import 'package:infrastructure/core/network/client/dio_factory.dart' as _i416;
import 'package:infrastructure/core/network/interceptors/auth_interceptor.dart'
    as _i1067;
import 'package:infrastructure/datasource/integration_external_datasource.dart'
    as _i594;
import 'package:infrastructure/mappers/mapper_module.dart' as _i747;
import 'package:infrastructure/mappers/response_mapper.dart' as _i866;
import 'package:infrastructure/module_register.dart' as _i604;
import 'package:infrastructure/repository/integration_external_repository_impl.dart'
    as _i894;
import 'package:injectable/injectable.dart' as _i526;

class InfrastructurePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    final mapperModule = _$MapperModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i114.ConnectionChecker>(
        () => registerModule.connectionChecker);
    gh.lazySingleton<_i866.ResponseMapper>(() => mapperModule.responseMapper());
    gh.lazySingleton<_i1067.AuthInterceptor>(
        () => registerModule.authInterceptor(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i416.DioFactory>(
        () => registerModule.dioFactory(gh<_i1067.AuthInterceptor>()));
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.dio(gh<_i416.DioFactory>()));
    gh.lazySingleton<_i463.ApiClient>(() => registerModule.apiClient(
          gh<_i361.Dio>(),
          gh<_i114.ConnectionChecker>(),
        ));
    gh.factory<_i594.IntegrationExternalDatasource>(
        () => _i594.IntegrationExternalDatasource(
              apiClient: gh<_i463.ApiClient>(),
              mapper: gh<_i866.ResponseMapper>(),
            ));
    gh.lazySingleton<_i494.IntegrationExternalRepository>(() =>
        _i894.IntegrationExternalRepositoryImpl(
            gh<_i594.IntegrationExternalDatasource>()));
  }
}

class _$RegisterModule extends _i604.RegisterModule {}

class _$MapperModule extends _i747.MapperModule {}
