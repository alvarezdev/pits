import 'package:domain/domain.dart';
import 'package:pits/application/department/bloc/department_cubit.dart';

class DepartmentViewModel {
  final bool isLoading;
  final List<Department> departments;
  final String? error;

  DepartmentViewModel({
    required this.isLoading,
    required this.departments,
    this.error,
  });
}

extension DepartmentMapper on DepartmentState {
  DepartmentViewModel toViewModel() {
    if (this is DepartmentLoading) {
      return DepartmentViewModel(isLoading: true, departments: []);
    } else if (this is DepartmentLoaded) {
      return DepartmentViewModel(
        isLoading: false,
        departments: (this as DepartmentLoaded).departments,
      );
    } else if (this is DepartmentError) {
      return DepartmentViewModel(
          isLoading: false,
          departments: [],
          error: (this as DepartmentError).message);
    }
    return DepartmentViewModel(isLoading: false, departments: []);
  }
}
