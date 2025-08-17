import 'package:domain/domain.dart';

class Shop {

  Shop({
    required this.nit,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.description,
    required this.percentage,
    required this.latitude,
    required this.longitude,
    required this.logoPath,
    required this.photoPaths,
    required this.user,
  }){
    if (nit.isNullOrEmpty ||
        name.isNullOrEmpty ||
        address.isNullOrEmpty ||
        phone.isNullOrEmpty ||
        email.isNullOrEmpty ||
        description.isNullOrEmpty ||
        percentage < 0 ||
        latitude < 0 ||
        longitude < 0 ||
        logoPath.isNullOrEmpty) {
      throw BusinessException(errorMessage);
    }
  }

  static const String errorMessage = "The entity have a attribute less than zero, empty or null";

  final String nit;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String description;
  final String logoPath;
  final double percentage;
  final double latitude;
  final double longitude;
  final List<String> photoPaths;
  final User user;
}
