import 'package:flutter/material.dart';
import 'package:pits/presentation/screen/sign_up/sign_up_connector.dart';
import 'package:pits/presentation/screen/sign_up/sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = 'sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SignUpConnector(
        builder: (context, viewModel) => SignUpWidget(
            onRegisterUser: viewModel.onRegisterUser,
            departments: viewModel.departments,
          ),
      ),
    );
  }
}


