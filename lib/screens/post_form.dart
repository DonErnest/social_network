import 'package:flutter/material.dart';
import 'package:social_network/services/post.dart';

class PostForm extends StatefulWidget {
  final String email;

  const PostForm({super.key, required this.email});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  late TextEditingController postTextController;

  String? _postText;

  @override
  void initState() {
    postTextController = TextEditingController();
    super.initState();
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    postTextController.dispose();
    super.dispose();
  }

  Future<void> onButtonPressed() async {
    if (_postText != null ) {
      var newPost = await uploadPost(email: widget.email, text: _postText!);
      if (newPost != null) {
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
            controller: postTextController,
            onChanged: (value) => setState(() => _postText = value),
            decoration: const InputDecoration(label: Text("new first name")),
            maxLines: 6,
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
