import 'dart:convert';

import 'package:infrastructure/core/constants/public_api_endpoints_constants.dart';
import 'package:infrastructure/core/network/api_client.dart';
import 'package:infrastructure/datasource/dto/department_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class IntegrationExternalDatasource {
  final ApiClient _apiClient;

  IntegrationExternalDatasource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  Future<List<DepartmentDto>> getDepartments() async {
    try {
      final response =
          await _apiClient.get(PublicApiEndpointsConstants.departments);
      final List<dynamic> data = jsonDecode(response.data);
      return data.map((json) => DepartmentDto.fromJson(json)).toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
