import 'package:domain/domain.dart';

abstract class ShopRepository {
  Future<List<Shop>> getAllShop();
  Future<Shop> getShop(String id);
}
