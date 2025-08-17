import 'package:domain/domain.dart';

class IntegrationExternalUseCase {
  final IntegrationExternalRepository _repository;

  IntegrationExternalUseCase({
    required IntegrationExternalRepository repository,
  }) : _repository = repository;

  Future<List<Department>> getDepartments() {
    return _repository.getDepartments();
  }
}
