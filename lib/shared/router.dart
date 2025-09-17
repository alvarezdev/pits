import 'package:pits/presentation/screen/screen.dart';
import 'package:pits/presentation/screen/sign_up/sign_up_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
  };
}
