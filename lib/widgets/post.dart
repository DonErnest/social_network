import 'package:flutter/material.dart';
import 'package:social_network/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post,});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text(post.message),
            subtitle: Text(
              'by: ${post.author}\n'
              'published on ${post.publishedDisplay}',
            ),
          ),
        ],
      ),
    );
  }
}
