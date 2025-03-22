import 'package:flutter/material.dart';
import 'package:social_network/models/destination.dart';
import 'package:social_network/screens/feed.dart';
import 'package:social_network/screens/login.dart';
import 'package:social_network/screens/user_form.dart';
import 'package:social_network/services/user.dart';

import 'enums.dart';
import 'models/user.dart';
import 'screens/subscription_form.dart';

class ErnesTwitter extends StatefulWidget {
  const ErnesTwitter({super.key});

  @override
  State<ErnesTwitter> createState() => _ErnesTwitterState();
}

class _ErnesTwitterState extends State<ErnesTwitter> {
  Screen currentScreen = Screen.login;
  final GlobalKey<PostFeedState> _postsScreenKey = GlobalKey();
  final GlobalKey<UserFormState> _userFormKey = GlobalKey();

  User? user;

  Destination get getCurrentDestination {
    if (currentScreen == Screen.login) {
      return Destination(
        type: Screen.login,
        screenTitle: "Login",
        screen: LoginScreen(onUserSaved: setUser),
      );
    } else {
      return Destination(
        type: Screen.feed,
        screenTitle: user!.fullName,
        screen: PostFeed(key: _postsScreenKey, user: user!),
        appBarActions: [
          IconButton(
            onPressed: openSubscriptionModal,
            icon: Icon(Icons.person_search_outlined),
          ),
          IconButton(onPressed: openEditUserModal, icon: Icon(Icons.settings)),
          IconButton(onPressed: logout, icon: Icon(Icons.exit_to_app)),
        ],
      );
    }
  }

  void logout() {
    setState(() {
      user = null;
      currentScreen = Screen.login;
    });
  }

  void openSubscriptionModal() {
    showModalBottomSheet(
      context: context,
      builder:
          (ctx) =>
          SubscriptionForm(
            subscriberEmail: user!.email,
            onSubscriptionRequested: subscriptionsUpdated,
          ),
    );
  }

  void _clearPosts() {
    _postsScreenKey.currentState
        ?.refreshPosts(); // Call a method to reset the child's state
  }

  void subscriptionsUpdated() {
    setState(() {
      _clearPosts();
    });
  }

  Future<void> editUser({
    required String newFirstName,
    required String newLastName,
  }) async {
    final updatedUser = await updateAndReturnUser(
      email: user!.email,
      data: {"firstName": newFirstName, "lastName": newLastName},
    );
    setState(() {
      if (updatedUser != null) {
        user = updatedUser;
      }
    });
  }

  void openEditUserModal() {
    showModalBottomSheet(
      context: context,
      builder:
          (ctx) =>
          UserForm(
              key: _userFormKey,
              currentUser: user!,
              updateUser: editUser,
              updateSubscriptions: subscriptionsUpdated
          ),
    );
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
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          destination.screenTitle,
          style: theme.textTheme.displaySmall,
        ),
        actions: destination.appBarActions,
      ),
      body: destination.screen,
    );
  }
}
