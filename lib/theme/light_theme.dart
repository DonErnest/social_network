import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(230, 230, 230, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
);
final lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    foregroundColor: lightColorScheme.onPrimaryContainer,
    titleTextStyle: TextStyle(color: lightColorScheme.onPrimaryContainer),
    toolbarTextStyle: TextStyle(color: lightColorScheme.onPrimaryContainer),
    actionsIconTheme: IconThemeData(color: Color.fromRGBO(230, 230, 230, 1)),
  ),
  dividerColor: Color.fromRGBO(41, 115, 115, 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.onPrimaryContainer,
      foregroundColor: lightColorScheme.primaryContainer,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: lightColorScheme.onPrimaryContainer,
      foregroundColor: lightColorScheme.primaryContainer,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        Color.fromRGBO(41, 115, 115, 1),
      ),
      foregroundColor: WidgetStatePropertyAll<Color>(
        Color.fromRGBO(230, 230, 230, 1),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Color.fromRGBO(57, 57, 58, 1)),
    fillColor: Colors.white,
    focusColor: Colors.white,
  ),
);
