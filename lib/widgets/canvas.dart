import 'package:flutter/material.dart';

class ScreenCanvas extends StatelessWidget {
  final Widget widget;
  const ScreenCanvas({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: widget
        ),
      ),
    );
  }
}
