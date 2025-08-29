import 'package:infrastructure/dto/department_dto.dart';
import 'package:infrastructure/mappers/response_mapper.dart';
import 'package:injectable/injectable.dart';

@module
abstract class MapperModule {
  @lazySingleton
  ResponseMapper responseMapper() {
    final mapper = ResponseMapper();
    mapper.register<DepartmentDto>(DepartmentDto.fromJson);
    return mapper;
  }
}
