import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_network/models/post.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/screens/post_form.dart';
import 'package:social_network/services/post.dart';
import 'package:social_network/widgets/canvas.dart';
import 'package:social_network/widgets/post.dart';

class PostFeed extends StatefulWidget {
  final User user;

  const PostFeed({super.key, required this.user});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  late final ScrollController _scrollController;

  List<Post> posts = [];
  DateTime? lastPostDateTime;
  bool needsScroll = false;

  Timer? _timer;

  Future<void> updatePosts() async {
    final newPosts = await getPosts(widget.user.email, lastPostDateTime);
    if (newPosts.isNotEmpty) {
      setState(() {
        needsScroll = true;
        posts = posts + newPosts;
        lastPostDateTime = posts.last.datetime;

        if (needsScroll) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
          needsScroll = false;
        }
      });
    }
    ;
  }

  Future<void> _scrollToEnd() async {
    if (_scrollController.hasClients) {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void startFetching() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      await updatePosts();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void openEditUserModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => PostForm(email: widget.user.email),
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    startFetching();
  }

  @override
  Widget build(BuildContext context) {
    var startingFromFreshPosts = posts.reversed.toList();
    return ScreenCanvas(
      widget: Column(
        children: [
          Expanded(
            flex: 12,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: startingFromFreshPosts.length,
              itemBuilder: (ctx, idx) => PostCard(post: startingFromFreshPosts[idx]),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: openEditUserModal,
                child: Text("Add Post"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
