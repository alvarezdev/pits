import 'package:domain/domain.dart';

class UserUseCase {
  final UserRepository _userRepository;

  UserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<User> registerUser(User userDto) {
    return _userRepository.registerUser(userDto);
  }

  Future<User> fetchUser(String email) {
    return _userRepository.fetchUser(email);
  }

  Future<String> changePassword(String email, String newPassword, String oldPassword) {
    return _userRepository.changePassword(email, newPassword, oldPassword);
  }

  Future<String> restorePassword(String document) {
    return _userRepository.restorePassword(document);
  }
}
