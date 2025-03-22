import 'package:flutter/material.dart';
import 'package:social_network/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.speaker_notes),
            title: Text(
                post.message,
              style: theme.textTheme.titleMedium!,
            ),
            subtitle: Text(
              'by: ${post.author}\n'
              'published on ${post.publishedDisplay}',
              style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
