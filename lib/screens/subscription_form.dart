import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_network/services/user.dart';

import '../util.dart';

class SubscriptionForm extends StatefulWidget {
  final String subscriberEmail;
  final void Function() onSubscriptionRequested;
  const SubscriptionForm({super.key, required this.onSubscriptionRequested, required this.subscriberEmail,});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  late TextEditingController emailController;
  String? _influencerEmail;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> onButtonPressed() async {
    if (_influencerEmail != null) {
      var subscribedSuccessfully = await subscribeToUser(widget.subscriberEmail, _influencerEmail!);
      if (subscribedSuccessfully) {
        print("Subscription done");
        widget.onSubscriptionRequested();
        onCanceled();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            onChanged: (value) => {isValidEmail(value)? setState(() => _influencerEmail = value) : null},
            decoration: const InputDecoration(label: Text("enter influencer email")),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: onButtonPressed,
                child: const Text("Subscribe"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
