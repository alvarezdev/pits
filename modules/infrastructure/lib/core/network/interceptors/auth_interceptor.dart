import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infrastructure/core/constants/app_constants.dart';
import 'package:infrastructure/core/constants/public_api_endpoints_constants.dart';
import 'package:infrastructure/core/network/errors/exceptions.dart';

class AuthInterceptor extends QueuedInterceptor {
  final FlutterSecureStorage secureStorage;

  AuthInterceptor(this.secureStorage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!PublicApiEndpointsConstants.all.contains(options.path)) {
      final token = await secureStorage.read(key: AppConstants.accessTokenKey);

      if (token != null && token.isNotEmpty) {
        options.headers[AppConstants.authorizationKey] =
            '${AppConstants.bearer} $token';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized &&
        !PublicApiEndpointsConstants.all.any((e) => err.requestOptions.path.contains(e))) {
      final refreshToken = await secureStorage.read(key: AppConstants.accessTokenKey);

      if (refreshToken == null) {
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: SessionExpiredException(),
          ),
        );
      }

      try {
        // Aquí llamas a tu endpoint de refresh usando un nuevo Dio temporal
        final refreshDio = Dio();
        final response = await refreshDio.post(
          AppConstants.baseUrl + PublicApiEndpointsConstants.refreshToken,
          data: {AppConstants.refreshTokenKey: refreshToken},
        );

        final newToken = response.data[AppConstants.accessTokenKey];
        await secureStorage.write(key: AppConstants.accessTokenKey, value: newToken);

        // Reintentar la request original con el nuevo token
        final opts = err.requestOptions;
        opts.headers[AppConstants.authorizationKey] =
            '${AppConstants.bearer} $newToken';
        final cloneReq = await refreshDio.fetch(opts);
        return handler.resolve(cloneReq);
      } catch (_) {
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: SessionExpiredException(),
          ),
        );
      }
    }

    handler.next(err); // pasa otros errores normalmente
  }
}
