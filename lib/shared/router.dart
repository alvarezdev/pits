import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pits/application/department/bloc/department_cubit.dart';
import 'package:pits/di/dependency_injection.dart';
import 'package:pits/presentation/screen/screen.dart';
import 'package:pits/presentation/screen/sign_up/sign_up_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    SignUpScreen.routeName: (context) => BlocProvider(
          create: (_) => getIt<DepartmentCubit>()..loadDepartments(),
          child: const SignUpScreen(),
        ),
  };
}
