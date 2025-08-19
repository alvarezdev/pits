import 'package:domain/domain.dart';

class Shop {
  static const String errorMessage =
      "The entity have a attribute less than zero, empty or null";

  final String id;
  final String name;
  final String address;
  final String nit;
  final String phone;
  final double latitude;
  final double longitude;
  final String email;
  final String department;
  final String municipality;
  final String logoPath;
  final List<({String id, String name})> productOrServiceList;

  Shop({
    required this.id,
    required this.name,
    required this.address,
    required this.nit,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.department,
    required this.municipality,
    required this.logoPath,
    required this.productOrServiceList,
  }) {
    if (name.isNullOrEmpty ||
        address.isNullOrEmpty ||
        nit.isNullOrEmpty ||
        phone.isNullOrEmpty ||
        latitude < 0 ||
        longitude < 0 ||
        email.isNullOrEmpty ||
        department.isNullOrEmpty ||
        municipality.isNullOrEmpty ||
        logoPath.isNullOrEmpty ||
        productOrServiceList.isEmpty) {
      throw BusinessException(errorMessage);
    }
  }
}
