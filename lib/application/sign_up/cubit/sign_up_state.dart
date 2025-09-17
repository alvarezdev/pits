
part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final List<Department> departments;
  SignUpLoaded(this.departments);
}

class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message);
}
