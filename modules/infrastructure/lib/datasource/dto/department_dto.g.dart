// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentDto _$DepartmentDtoFromJson(Map<String, dynamic> json) =>
    DepartmentDto(
      department: json['departamento'] as String,
      cities:
          (json['ciudades'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DepartmentDtoToJson(DepartmentDto instance) =>
    <String, dynamic>{
      'departamento': instance.department,
      'ciudades': instance.cities,
    };
