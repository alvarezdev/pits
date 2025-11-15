class AppConstants {
  //BaseUrl
  static const String baseUrl = 'http://localhost:8080/api/';

  // Storage keys
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  // Timeout Dio (milisegundos)
  static const int connectTimeout = 10000;
  static const int receiveTimeout = 10000;

  // Otros valores globales
  static const String contentType = 'application/json';
  static const String authorizationKey = 'Authorization';
  static const String bearer = 'Bearer';
}