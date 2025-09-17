import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final IntegrationExternalRepository _repository;

  SignUpCubit(this._repository) : super(SignUpInitial());

  Future<void> loadDepartments() async {
    emit(SignUpLoading());
    try {
      final departments = await _repository.getDepartments();
      emit(SignUpLoaded(departments));
    } catch (e) {
      emit(SignUpError("Failed to load departments"));
    }
  }
}
