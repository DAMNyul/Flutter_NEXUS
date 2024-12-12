import 'package:flutter/material.dart';

// PostDetailPage에서 안전한 null 처리
class PostDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const PostDetailPage({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Post Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.isNotEmpty ? title : '제목 없음', // null 체크 및 기본값 처리
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content.isNotEmpty ? content : '내용 없음', // null 체크 및 기본값 처리
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
