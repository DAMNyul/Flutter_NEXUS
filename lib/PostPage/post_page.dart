// PostPage/post_page.dart
import 'package:flutter/material.dart';
import 'create_post_page.dart'; // CreatePostPage 관련 코드 임포트
import 'post_container.dart'; // PartyOfPostContainer 관련 코드 임포트

class PostPage extends StatefulWidget {
  final List<Map<String, String>> posts = [];

  PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: widget.posts.isEmpty
            ? const Center(
                child: Text(
                  'No posts yet.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : PartyOfPostContainer(posts: widget.posts),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // CreatePostPage에서 새 포스트 데이터를 받아옴
          final newPost = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePostPage(),
            ),
          );

          // 전달된 데이터가 null이 아닌 경우 상태 업데이트
          if (newPost != null) {
            setState(() {
              widget.posts.add(newPost);
            });
          }
        },
        backgroundColor: const Color(0xFFDAE9FF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// PostPage/create_post_page.dart
