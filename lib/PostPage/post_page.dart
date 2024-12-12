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
        backgroundColor: Colors.white, // 배경색 하얀색 고정
        title: const Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0, // 그림자 제거
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // 배경 원들
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * -0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF7E3),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.width * -0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF7E3),
                ),
              ),
            ),
            // 메인 컨텐츠
            widget.posts.isEmpty
                ? const Center(
                    child: Text(
                      'No posts yet.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : PartyOfPostContainer(posts: widget.posts),
          ],
        ),
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
