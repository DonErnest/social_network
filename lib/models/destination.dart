import 'package:flutter/material.dart';
import 'package:social_network/enums.dart';

class Destination {
  final Screen type;
  final Widget screenTitle;
  final List<Widget>? appBarActions;
  final Widget screen;

  Destination({
    required this.type,
    required this.screenTitle,
    this.appBarActions,
    required this.screen,
  });
}