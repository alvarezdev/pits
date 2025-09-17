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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign Up'),
      ),
      body: SignUpConnector(
        builder: (context, viewModel) => SignUpWidget(
            departments: viewModel.departments,
          ),
      ),
    );
  }
}


