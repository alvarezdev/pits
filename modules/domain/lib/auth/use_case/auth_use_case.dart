import 'package:domain/domain.dart';

class AuthUseCase {
  final AuthRepositroy _authRepositroy;

  AuthUseCase({
    required AuthRepositroy authRepositroy,
  }) : _authRepositroy = authRepositroy;

  Future<String> loginUser(String email, String password) {
    return _authRepositroy.loginUser(email, password);
  }
}
