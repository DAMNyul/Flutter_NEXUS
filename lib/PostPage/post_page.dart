import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import 'create_post_page.dart';
import 'post_container.dart';

class PostPage extends StatelessWidget {
  final String currentUserId;

  const PostPage({super.key, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Post List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
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
            // 메인 컨테이너와 포스트 리스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: postProvider.posts.isEmpty
                  ? const Center(
                      child: Text(
                        '등록된 포스트가 없습니다.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : PartyOfPostContainer(
                      posts: postProvider.posts,
                      currentUserId: currentUserId,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffF4F9FF),
        onPressed: () async {
          final result = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostPage()),
          );

          if (result != null) {
            // 새 포스트 추가 로직
            Provider.of<PostProvider>(context, listen: false)
                .addPost(result['title'], result['content'], currentUserId);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
