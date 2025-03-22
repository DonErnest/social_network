import 'package:flutter/material.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(230, 230, 230, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
  brightness: Brightness.dark,
);
final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    foregroundColor: darkColorScheme.onPrimaryContainer,
    titleTextStyle: TextStyle(color: darkColorScheme.onPrimaryContainer),
    toolbarTextStyle: TextStyle(color: darkColorScheme.onPrimaryContainer),
    actionsIconTheme: IconThemeData(color: Color.fromRGBO(41, 115, 115, 1)),
  ),
  dividerColor: Color.fromRGBO(233, 215, 88, 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.onPrimaryContainer,
      foregroundColor: darkColorScheme.primaryContainer,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: darkColorScheme.onPrimaryContainer,
      foregroundColor: darkColorScheme.primaryContainer,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        Color.fromRGBO(230, 230, 230, 1),
      ),
      foregroundColor: WidgetStatePropertyAll<Color>(
        Color.fromRGBO(41, 115, 115, 1),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Color.fromRGBO(230, 230, 230, 1)),
    fillColor: Colors.white,
    focusColor: Colors.white,
  ),
);
