import 'package:domain/domain.dart';

class ProductOrService {
  static const String errorMessage =
      "The entity have a attribute less than zero, empty or null";

  final String id;
  final String name;

  ProductOrService({
    required this.id,
    required this.name,
  }) {
    if (id.isNullOrEmpty || name.isNullOrEmpty) {
      throw BusinessException(errorMessage);
    }
  }
}
