import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pits/di/dependency_injection.dart';
import 'package:pits/l10n-generated/l10n.dart';
import 'package:pits/presentation/screen/home/home_screen.dart';
import 'package:pits/shared/router.dart';
import 'package:pits/shared/theme_pits.dart';

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
      debugShowCheckedModeBanner: false,
      supportedLocales: S.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: pitsTheme,
      initialRoute: HomeScreen.routeName,
      routes: AppRouter.routes,
    );
  }
}

