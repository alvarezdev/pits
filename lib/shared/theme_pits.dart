import 'package:pits/presentation/screen/screen.dart';
import 'package:pits/shared/color_pits.dart';

final ThemeData pitsTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light, // Tema claro pero visualmente oscuro
  scaffoldBackgroundColor: const Color(0xFF252B30), // colorPrimary
  primaryColor: const Color(0xFF252B30),
  colorScheme: const ColorScheme.light(
    primary: ColorPits.primaryColor, // Fondo base
    secondary: ColorPits.secondaryColor, // Amarillo PITS
    surface: ColorPits.surfaceColor, // Fondo para tarjetas/dialogs
    onPrimary: Colors.white, // Texto sobre fondo oscuro
    onSecondary: Colors.black, // Texto sobre botones amarillos
    onSurface: Colors.white,
    error: Color(0xFFFF5252),
    onError: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF252B30),
    elevation: Dimensions.d0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: Dimensions.d20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Color(0xFFEEEEEE)),
    bodySmall: TextStyle(color: Color(0xFF777777)), // gris_53pc
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Colors.white),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ColorPits.secondaryColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorPits.secondaryColor,
      foregroundColor: Colors.black,
      minimumSize: const Size(double.infinity, 48),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white, width: 1.2),
      minimumSize: const Size(double.infinity, 48),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2C3137),
    hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
    labelStyle: const TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFFFBF00)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFFFBF00), width: 2),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  dividerColor: const Color(0xFFCFCFCF), // colorShadow
  shadowColor: const Color(0xFFCFCFCF),
);
