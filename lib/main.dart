import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pits/di/dependency_injection.dart';
import 'package:pits/screen/home/bloc/department_cubit.dart';
import 'package:pits/shared/router.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pits',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: MyHomePage.routeName,
      routes: AppRouter.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  static const routeName = 'home-page';

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
        }
      ),);
  }
}
