import 'package:flutter/material.dart';
import 'package:social_network/enums.dart';

class Destination {
  final Screen type;
  final Widget screenTitle;
  final String navLabel;
  final IconData icon;
  final IconData? selectedIcon;
  final List<Widget>? appBarActions;
  final Widget screen;

  Destination({
    required this.type,
    required this.screenTitle,
    required this.navLabel,
    required this.icon,
    this.selectedIcon,
    this.appBarActions,
    required this.screen,
  });
}