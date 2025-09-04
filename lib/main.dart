import 'package:flutter/material.dart';
import 'package:pits/di/dependency_injection.dart';
import 'package:pits/presentation/screen/home/home_screen.dart';
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
      initialRoute: HomeScreen.routeName,
      routes: AppRouter.routes,
    );
  }
}
