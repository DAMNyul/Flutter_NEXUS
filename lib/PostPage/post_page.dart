import 'package:flutter/material.dart';
import 'package:flutter_nexus/PostPage/create_post_page.dart';
import 'package:flutter_nexus/PostPage/post_container.dart';

class PostPage extends StatelessWidget {
  final List<Map<String, String>> posts;

  // posts를 필수로 받는 생성자
  const PostPage({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 배경 원들
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * -0.3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF7E3),
                ),
              ),
            ),
          ),
          // 포스트 리스트 표시
          PartyOfPostContainer(posts: posts),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePostPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFFDAE9FF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
