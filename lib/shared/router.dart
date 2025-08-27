import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pits/di/dependency_injection.dart';
import 'package:pits/main.dart';
import 'package:pits/screen/home/bloc/department_cubit.dart';
import 'package:pits/screen/screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    //HomeScreen.routeName: (context) => const HomeScreen(),
    MyHomePage.routeName: (context) => BlocProvider(
          create: (_) => getIt<DepartmentCubit>()..loadDepartments(),
          child: const MyHomePage(
            title: 'Pits Home',
          ),
        ),
  };
}
