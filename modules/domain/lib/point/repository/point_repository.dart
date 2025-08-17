import 'package:domain/domain.dart';

abstract class PointRepository {
  Future<List<Point>> getPoints(String id);
}