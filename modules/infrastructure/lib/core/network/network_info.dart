import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkVerify implements NetworkInfo {
  final InternetConnectionChecker checker;

  NetworkVerify(this.checker);

  @override
  Future<bool> get isConnected => checker.hasConnection;
}