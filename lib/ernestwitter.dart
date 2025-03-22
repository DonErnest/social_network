import 'package:flutter/material.dart';

class ErnesTwitter extends StatefulWidget {
  const ErnesTwitter({super.key});

  @override
  State<ErnesTwitter> createState() => _ErnesTwitterState();
}

class _ErnesTwitterState extends State<ErnesTwitter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Placeholder(),
        bottomNavigationBar: NavigationBar(destinations: []),
      ),
    );
  }
}
