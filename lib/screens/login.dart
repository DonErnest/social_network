import 'package:flutter/material.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/services/user.dart';
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
  
  Future<void> onButtonPressed () async {
    if (_email != null) {
      final user = await getOrCreateUser(_email!);
      if (user != null) {
        widget.onUserSaved(user);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Please, login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Divider(
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
            TextField(
              controller: _loginController,
              onChanged: (value) => setState(() => _email = value),
              maxLines: 1,
              maxLength: 30,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: const InputDecoration(
                label: Text(
                  "Your email",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
              ),
            ),
            IconButton(
              onPressed: onButtonPressed,
              icon: Icon(Icons.arrow_forward),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                    Color.fromRGBO(255, 163, 26, 1)),
                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
