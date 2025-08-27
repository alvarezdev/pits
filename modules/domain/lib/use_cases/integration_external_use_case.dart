import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class IntegrationExternalUseCase {
  final IntegrationExternalRepository _repository;

  IntegrationExternalUseCase({
    required IntegrationExternalRepository repository,
  }) : _repository = repository;

  Future<List<Department>> getDepartments() {
    return _repository.getDepartments();
  }
}
