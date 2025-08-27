import 'dart:io';

import 'package:dio/dio.dart';
import 'package:infrastructure/core/network/errors/exceptions.dart';

extension DioExceptionExtension on DioException {
  AppException toAppException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NoConnectionException();

      case DioExceptionType.badResponse:
        final statusCode = response?.statusCode;
        if (statusCode == HttpStatus.unauthorized) {
          return UnauthorizedException();
        } else if (statusCode == HttpStatus.forbidden) {
          return SessionExpiredException();
        } else {
          return ServerException(
            statusCode: statusCode,
            message: response?.statusMessage ?? message,
          );
        }

      case DioExceptionType.cancel:
        return RequestCancelledException();

      default:
        return ServerException(message: message);
    }
  }
}