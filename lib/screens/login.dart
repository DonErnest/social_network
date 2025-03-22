import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/services/user.dart';
import 'package:social_network/util.dart';
import 'package:social_network/widgets/canvas.dart' show ScreenCanvas;

class LoginScreen extends StatefulWidget {
  final void Function(User user) onUserSaved;

  const LoginScreen({super.key, required this.onUserSaved});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _loginController;
  String? _email;

  @override
  void initState() {
    _loginController = TextEditingController();
    super.initState();
  }

  Future<void> onButtonPressed() async {
    if (_email != null) {
      final user = await getOrCreateUser(_email!);
      if (user != null) {
        widget.onUserSaved(user);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ScreenCanvas(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please, login",
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Divider(),
            TextField(
              controller: _loginController,
              onChanged: (value) => {isValidEmail(value)? setState(() => _email = value) : null},
              maxLines: 1,
              maxLength: 30,
              decoration: const InputDecoration(
                label: Text(
                  "Your email",
                ),
              ),
            ),
            IconButton(
              onPressed: onButtonPressed,
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
