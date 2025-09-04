import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pits/application/department/bloc/department_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = 'sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign Up'),
      ),
      body: BlocBuilder<DepartmentCubit, DepartmentState>(
          builder: (context, state) {
        if (state is DepartmentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DepartmentLoaded) {
          final departments = state.departments;
          return ListView.builder(
            itemCount: departments.length,
            itemBuilder: (context, index) {
              final department = departments[index];
              return ListTile(
                title: Text(department.department),
                subtitle: Text(department.cities.join(', ')),
              );
            },
          );
        } else if (state is DepartmentError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text("Press button to load"));
      }),
    );
  }
}
