import 'package:domain/domain.dart';

class ShopUseCase {
  final ShopRepository _shopRepository;

  ShopUseCase({
    required ShopRepository shopRepository,
  }) : _shopRepository = shopRepository;

  Future<List<Shop>> getAllShop() {
    return _shopRepository.getAllShop();
  }

  Future<Shop> getShop(String id) {
    return _shopRepository.getShop(id);
  }
}
