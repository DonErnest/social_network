import 'package:flutter/material.dart';
import 'package:social_network/models/destination.dart';
import 'package:social_network/screens/feed.dart';
import 'package:social_network/screens/login.dart';

import 'enums.dart';
import 'models/user.dart';

class ErnesTwitter extends StatefulWidget {
  const ErnesTwitter({super.key});

  @override
  State<ErnesTwitter> createState() => _ErnesTwitterState();
}

class _ErnesTwitterState extends State<ErnesTwitter> {
  Screen currentScreen = Screen.login;
  User? user;

  Destination get getCurrentDestination {
    if (currentScreen == Screen.login) {
      return Destination(
        type: Screen.login,
        screenTitle: Text("Login"),
        screen: LoginScreen(onUserSaved: setUser),
      );
    } else {
      return Destination(
        type: Screen.feed,
        screenTitle: Text(user!.fullName),
        screen: PostFeed(user: user!),
      );
    }
  }

  void setUser(User newUser) {
    setState(() {
      user = newUser;
      currentScreen = Screen.feed;
    });
  }

  @override
  Widget build(BuildContext context) {
    var destination = getCurrentDestination;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: destination.screenTitle,
          actions: destination.appBarActions,
        ),
        body: destination.screen,
      ),
    );
  }
}
