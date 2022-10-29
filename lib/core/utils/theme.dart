import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.snackBarActionColor,
    required this.colour,
    required this.errorColour,
    required this.decoration,
  });

  final Color? colour;
  final Color? errorColour;
  final BoxDecoration? decoration;
  final Color? snackBarActionColor;

  @override
  MyColors copyWith(
      {Color? colour,
      Color? errorColour,
      BoxDecoration? decoration,
      Color? snackBarActionColor}) {
    return MyColors(
      snackBarActionColor: snackBarActionColor ?? this.snackBarActionColor,
      colour: colour ?? this.colour,
      errorColour: errorColour ?? this.errorColour,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      snackBarActionColor:
          Color.lerp(snackBarActionColor, other.snackBarActionColor, t),
      colour: Color.lerp(colour, other.colour, t),
      errorColour: Color.lerp(errorColour, other.errorColour, t),
      decoration: BoxDecoration.lerp(decoration, other.decoration, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $colour, danger: $errorColour)';
}

class StreamzTheme extends ChangeNotifier {
  static ThemeData light(Color color, bool material3) {
    return ThemeData.light().copyWith(
      primaryColor: material3 ? color : null,
      useMaterial3: material3,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF242A36),
        foregroundColor: const Color(0xFFE2E6ED),
      )),
      iconTheme: const IconThemeData(
        color: Color(0xFF242A36),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF7B00),
      ),
      scaffoldBackgroundColor: const Color(0xFFE2E6ED),
      appBarTheme: const AppBarTheme(
        color: Color(0xFFE2E6ED),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 24.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.normal,
        ),
        headline4: TextStyle(
          fontSize: 20.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 16.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        button: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
      ),
      colorScheme: material3 ? ColorScheme.fromSeed(seedColor: color) : null,
      extensions: <ThemeExtension<dynamic>>[
        const MyColors(
          snackBarActionColor: Color(0xFF242A36),
          colour: Color(0xFF00296B),
          errorColour: Color(0xFFB00020),
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
        ),
      ],
    );
  }

  static ThemeData dark(Color color, bool material3) {
    return ThemeData.dark().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF242A36),
          backgroundColor: const Color(0xFFE2E6ED),
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF242A36),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF7155),
      ),
      cardTheme: const CardTheme(
        color: Color(0xFF17191D),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFE2E6ED),
      ),
      scaffoldBackgroundColor: const Color(0xFF242A36),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 24.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.normal,
        ),
        headline4: TextStyle(
          fontSize: 20.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 16.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.w400,
        ),
        button: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w600,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          color: Color(0xFFE2E6ED),
          fontWeight: FontWeight.w400,
        ),
      ),
      primaryColor: material3 ? color : null,
      useMaterial3: material3,
      colorScheme: material3 ? ColorScheme.fromSeed(seedColor: color) : null,
      extensions: <ThemeExtension<dynamic>>[
        const MyColors(
          snackBarActionColor: Color(0xFFE2E6ED),
          colour: Color(0xFF6B8BC3),
          errorColour: Color(0xFFCF6679),
          decoration: BoxDecoration(
            color: Color(0xFF212121),
          ),
        ),
      ],
    );
  }

  static bool _isDarkTheme = true;
  bool get isDarkTheme => _isDarkTheme;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
