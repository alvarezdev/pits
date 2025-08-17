import 'package:domain/domain.dart';

class Invoice {

  Invoice({
    required this.id,
    required this.date,
    required this.valueProducts,
    required this.valueServices,
    required this.percentage,
    required this.description,
    required this.user,
    required this.shop,
    required this.state,
  }){
    if (id.isNullOrEmpty ||
        valueProducts < 0 ||
        valueServices < 0 ||
        percentage < 0 ||
        description.isNullOrEmpty) {
      throw BusinessException(errorMessage);
      
    }
  }

  static const String errorMessage = "The entity have a attribute less than zero, empty or null";

  String id;
  DateTime date;
  double valueProducts;
  double valueServices;
  double percentage;
  String description;
  User user;
  Shop shop;
  PurchaseStatus state;
}