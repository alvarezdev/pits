import 'package:domain/domain.dart';

class PointUseCase {
  final PointRepository _pointRepository;

  PointUseCase({
    required PointRepository pointRepository,
  }) : _pointRepository = pointRepository;

  Future<List<Point>> getPoint(String id) async {
    return _pointRepository.getPoints(id);
  }
}
