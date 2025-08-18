import 'package:domain/domain.dart';

abstract class IntegrationExternalRepository {
  Future<List<Department>> getDepartments();
}
