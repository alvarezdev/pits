import 'package:domain/domain.dart';
import 'package:infrastructure/datasource/integration_external_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IntegrationExternalRepository)
class IntegrationExternalRepositoryImpl
    implements IntegrationExternalRepository {
  final IntegrationExternalDatasource _datasource;

  IntegrationExternalRepositoryImpl(this._datasource);

  @override
  Future<List<Department>> getDepartments() async {
    final departments = await _datasource.getDepartments();

    return departments
        .map((item) =>
            Department(department: item.department, cities: item.cities))
        .toList();
  }
}
