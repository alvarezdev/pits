import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<User> registerUser(User userDto);
  Future<User> fetchUser(String email);
  Future<String> changePassword(String email, String newPassword, String oldPassword);
  Future<String> restorePassword(String document);
}
