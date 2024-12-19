import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nexus/models/post_models.dart';
import '../provider/provider.dart';
import 'post_detail_page.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  final String currentUserId;

  const PostContainer({
    super.key,
    required this.post,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final bool isLiked = post.likedUsers.contains(currentUserId);

    String formatTimeAgo(DateTime createdAt) {
      final Duration difference = DateTime.now().difference(createdAt);

      if (difference.inMinutes < 1) {
        return '방금 전';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes}분 전';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}시간 전';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}일 전';
      } else {
        return '${(difference.inDays / 7).floor()}주 전';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(
                title: post.title,
                content: post.content,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.01),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 표시
              Text(
                '${post.title} | ${post.author}', // 작성자 이름 추가
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // 내용 표시 (20자 제한 적용)
              Text(
                _truncateContent(post.content),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          postProvider.togglePostLike(post.id, currentUserId);
                        },
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('${post.likeCount} likes'),
                    ],
                  ),
                  // 작성 시간 표시
                  Text(
                    formatTimeAgo(post.createdAt),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 내용을 20자 이하로 자르고 나머지는 '...'으로 대체
  String _truncateContent(String content) {
    const int maxLength = 27; // 최대 글자 수
    if (content.length > maxLength) {
      return '${content.substring(0, maxLength)}...';
    }
    return content;
  }
}

class PartyOfPostContainer extends StatelessWidget {
  final List<Post> posts;
  final String currentUserId;

  const PartyOfPostContainer({
    super.key,
    required this.posts,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostContainer(
          post: posts[index],
          currentUserId: currentUserId,
        );
      },
    );
  }
}
