import 'package:flutter/material.dart';
import 'create_post_page.dart'; // CreatePostPage 관련 코드 임포트
// PartyOfPostContainer 관련 코드 임포트
import 'post_detail_page.dart';

// PostPage에서 새로 생성된 포스트를 받는 부분 수정

class PostPage extends StatefulWidget {
  final String currentUserId;

  const PostPage({super.key, required this.currentUserId});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Map<String, String>> posts = []; // 포스트 목록 상태

  // 포스트 삭제 후 상태 업데이트 함수
  void _updatePostList(String postId) {
    setState(() {
      posts.removeWhere((post) => post['id'] == postId); // 해당 id에 해당하는 포스트 삭제
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("포스트 리스트"),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        // 예시로 데이터를 FutureBuilder로 비동기 처리했다고 가정
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("에러 발생"));
          }

          final posts = snapshot.data ?? []; // null 체크 추가
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post['title'] ?? '제목 없음'), // null 체크 추가
                subtitle: Text(post['content'] ?? '내용 없음'), // null 체크 추가
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailPage(
                        title: post['title'] ?? '제목 없음', // null 체크 추가
                        content: post['content'] ?? '내용 없음', // null 체크 추가
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        future: Future.value(posts), // 실제 데이터를 Future로 전달
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF4F9FF),
        onPressed: () async {
          // 포스트 추가 페이지로 이동
          final newPost = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostPage()),
          );

          // 새로 생성된 포스트가 null이 아닐 때만 추가
          if (newPost != null) {
            setState(() {
              posts.add(newPost); // 포스트 목록에 새 포스트 추가
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
