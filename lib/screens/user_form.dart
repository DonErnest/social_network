import 'package:flutter/material.dart';
import 'package:social_network/models/user.dart';

class UserForm extends StatefulWidget {
  final User currentUser;
  final Future<void> Function({
    required String newFirstName,
    required String newLastName,
  })
  onUserUpdated;

  const UserForm({
    super.key,
    required this.currentUser,
    required this.onUserUpdated,
  });

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  String? _editedFirstName;
  String? _editedLastName;

  @override
  void initState() {
    firstNameController = TextEditingController(
      text: widget.currentUser.firstName,
    );
    lastNameController = TextEditingController(
      text: widget.currentUser.lastName,
    );

    _editedFirstName = widget.currentUser.firstName;
    _editedLastName = widget.currentUser.lastName;

    super.initState();
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> onButtonPressed() async {
    if (_editedFirstName != null && _editedLastName != null) {
      await widget.onUserUpdated(
        newFirstName: _editedFirstName!,
        newLastName: _editedLastName!,
      );
      onCanceled();
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
            controller: firstNameController,
            onChanged: (value) => setState(() => _editedFirstName = value),
            decoration: const InputDecoration(label: Text("new first name")),
          ),
          TextField(
            controller: lastNameController,
            onChanged: (value) => setState(() => _editedLastName = value),
            decoration: const InputDecoration(label: Text("new last name")),
          ),
          Row(
            children: [
              TextButton(onPressed: onCanceled, child: Text('Cancel')),
              const Spacer(),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
