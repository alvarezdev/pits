import 'package:domain/entities/department.dart';
import 'package:json_annotation/json_annotation.dart';

part 'department_dto.g.dart';

@JsonSerializable()
class DepartmentDto {
  @JsonKey(name: 'departamento')
  final String department;

  @JsonKey(name: 'ciudades')
  final List<String> cities;

  DepartmentDto({
    required this.department,
    required this.cities,
  });

  factory DepartmentDto.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentDtoToJson(this);

  Department toEntity() => Department(
        department: department,
        cities: cities,
      );
}
