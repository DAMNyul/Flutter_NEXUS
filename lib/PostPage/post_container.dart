import 'package:flutter/material.dart';
import 'post_detail_page.dart'; // PostDetailPage 경로를 확인하고 추가

class PostContainer extends StatelessWidget {
  final String title;
  final String content;
  final String postId; // 포스트의 ID 추가 (삭제 확인용)
  final String currentUserId; // 현재 사용자 ID 추가

  const PostContainer({
    super.key,
    required this.title,
    required this.content,
    required this.postId,
    required this.currentUserId,
  });

  // 삭제 함수
  void _deletePost(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('정말 해당 게시물 "$title"을 삭제하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '아니요',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // 포스트 삭제 코드 작성 (삭제 후 리스트 갱신 등)
                Navigator.of(context).pop(); // 다이얼로그 닫기

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('삭제되었습니다')),
                );

                // 삭제 후 PostPage로 이동하면서 포스트를 갱신할 수 있도록 전달
                Navigator.pop(context, postId);
              },
              child: const Text(
                '네',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(
                title: title,
                content: content,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.75,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              // 삭제 버튼 추가 (오른쪽 상단)
              if (currentUserId == postId) // 작성자와 사용자가 같을 때만 표시
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deletePost(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PartyOfPostContainer extends StatelessWidget {
  final List<Map<String, String>> posts;
  final String currentUserId; // 현재 사용자 ID

  const PartyOfPostContainer(
      {super.key, required this.posts, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: posts.map((post) {
        return PostContainer(
          title: post['title']!,
          content: post['content']!,
          postId: post['id']!,
          currentUserId: currentUserId, // 사용자 ID 전달
        );
      }).toList(),
    );
  }
}
