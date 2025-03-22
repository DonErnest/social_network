import 'package:flutter/material.dart';
import 'package:social_network/ernestwitter.dart';
import 'package:social_network/theme/dark_theme.dart';
import 'package:social_network/theme/light_theme.dart';

void main() {
  runApp(
    MaterialApp(home: ErnesTwitter(), theme: lightTheme, darkTheme: darkTheme),
  );
}
