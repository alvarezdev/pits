



import 'package:flutter/material.dart';
import 'package:pits/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:pits/shared/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pits Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.d30),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SignUpScreen.routeName,
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Sign Up'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
