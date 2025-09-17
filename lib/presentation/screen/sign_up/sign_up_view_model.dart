import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:pits/application/sign_up/cubit/sign_up_cubit.dart';

class SingUpViewModel {
  final List<Department> departments;
  final VoidCallback? onRegisterUser;

  SingUpViewModel({
    required this.departments,
    required this.onRegisterUser,
  });

  factory SingUpViewModel.fromStates(
    BuildContext context,
    List<Department> departments,
  ) {
    return SingUpViewModel(
      departments: departments,
      onRegisterUser: () {},
    );
  }
}

extension SingUpViewMapper on SignUpState {
  SingUpViewModel toViewModel(BuildContext context) {
    if (this is SignUpLoaded) {
      return SingUpViewModel.fromStates(
        context,
        (this as SignUpLoaded).departments,
      );
    }
    return SingUpViewModel.fromStates(context, []);
  }
}
