import 'package:domain/domain.dart';

class Point {
  String id;
  Invoice purchase;
  double totalCash;
  double redeemedCash;

  Point({
    required this.id,
    required this.purchase,
    required this.totalCash,
    required this.redeemedCash,
  }) {
    if (id.isNullOrEmpty || totalCash < 0 || redeemedCash < 0) {
      throw BusinessException(errorMessage);
    }
  }

  static const String errorMessage =
      "The entity have a attribute less than zero, empty or null";
}
