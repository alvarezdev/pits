class AppException implements Exception {}
class NoConnectionException implements AppException {}
class RequestCancelledException implements AppException {}
class UnauthorizedException implements AppException {}
class SessionExpiredException implements AppException {}
class ServerException implements AppException {
  final int? statusCode;
  final String? message;

  ServerException({this.statusCode, this.message});

}
