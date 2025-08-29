import 'package:infrastructure/core/constants/public_api_endpoints_constants.dart';
import 'package:infrastructure/core/network/client/api_client.dart';
import 'package:infrastructure/dto/department_dto.dart';
import 'package:infrastructure/mappers/response_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class IntegrationExternalDatasource {
  final ApiClient _apiClient;
  final ResponseMapper _mapper;

  IntegrationExternalDatasource({
    required ApiClient apiClient,
    required ResponseMapper mapper,
  })  : _apiClient = apiClient,
        _mapper = mapper;

  Future<List<DepartmentDto>> getDepartments() async {
    final response =
        await _apiClient.get(PublicApiEndpointsConstants.departments);
    return _mapper.fromJsonList<DepartmentDto>(response);
  }
}
