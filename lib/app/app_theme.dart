import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  AutoTheme get theme {
    final brightness = MediaQuery.of(this).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return AutoTheme.darkTheme;
    } else {
      return AutoTheme.lightTheme;
    }
  }
}

@immutable
class AutoTheme extends ThemeExtension<AutoTheme> {
  const AutoTheme({
    required this.background1,
    required this.background2,
    required this.text1,
    required this.text2,
    required this.error,
    required this.black,
    required this.white,
    required this.purple,
    required this.orange,
  });

  final Color background1;
  final Color background2;
  final Color text1;
  final Color text2;
  final Color error;
  final Color black;
  final Color white;
  final Color purple;
  final Color orange;

  static const lightTheme = darkTheme;
  static const darkTheme = AutoTheme(
    background1: Color(0xFFF4B09B),
    background2: Color(0xFF000000),
    text1: Color(0xFFFFFFFF),
    text2: Color(0xFFD3BDD9),
    purple: Color(0xFFFF00C3),
    orange: Color(0xFFFFBB00),
    error: Color(0xFFFF7575),
    black: Color(0xFF000000),
    white: Color(0xFFFFFFFF),
  );

  @override
  ThemeExtension<AutoTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AutoTheme> lerp(ThemeExtension<AutoTheme>? other, double t) {
    throw UnimplementedError();
  }
}
