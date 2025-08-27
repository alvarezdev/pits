
part of 'department_cubit.dart';

abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class DepartmentLoading extends DepartmentState {}

class DepartmentLoaded extends DepartmentState {
  final List<Department> departments;
  DepartmentLoaded(this.departments);
}

class DepartmentError extends DepartmentState {
  final String message;
  DepartmentError(this.message);
}
