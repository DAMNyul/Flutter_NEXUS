import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final String title;
  final String content;

  const PostContainer({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.75, // 넓이 조정
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartyOfPostContainer extends StatelessWidget {
  final List<Map<String, String>> posts;

  const PartyOfPostContainer({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: posts.map((post) {
        return GestureDetector(
          onTap: () {
            // 포스트 클릭 시
            // 여기서 별도의 페이지로 이동하는 로직을 넣지 않고,
            // 포스트를 현재 화면에서 표시하는 방식으로
          },
          child: PostContainer(
            title: post['title']!,
            content: post['content']!,
          ),
        );
      }).toList(),
    );
  }
}
