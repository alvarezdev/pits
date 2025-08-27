import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'department_state.dart';

@injectable
class DepartmentCubit extends Cubit<DepartmentState> {
  final IntegrationExternalRepository _repository;

  DepartmentCubit(this._repository) : super(DepartmentInitial());

  Future<void> loadDepartments() async {
    emit(DepartmentLoading());
    try {
      final departments = await _repository.getDepartments();
      emit(DepartmentLoaded(departments));
    } catch (e) {
      emit(DepartmentError("Failed to load departments"));
    }
  }
}
