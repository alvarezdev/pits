import 'package:domain/domain.dart';

class User {
  static const String errorMessage =
      "The entity have a attribute empty or null ";

  final String id;
  final String name;
  final String email;
  final String phone;
  final String departmentBirth;
  final String cityBirth;
  final String password;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.departmentBirth,
    required this.cityBirth,
    required this.password,
  }) {
    if (id.isNullOrEmpty ||
        name.isNullOrEmpty ||
        email.isNullOrEmpty ||
        phone.isNullOrEmpty ||
        departmentBirth.isNullOrEmpty ||
        cityBirth.isNullOrEmpty ||
        password.isNullOrEmpty) {
      throw BusinessException(errorMessage);
    }
  }
}
