// lib/models/post_model.dart
import 'package:flutter/foundation.dart';

class Post {
  String id;
  String title;
  String content;
  String userId; // 포스트 작성자 ID
  Set<String> likedUsers; // 좋아요 누른 사용자들의 ID
  DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    Set<String>? likedUsers,
    DateTime? createdAt,
  })  : likedUsers = likedUsers ?? {},
        createdAt = createdAt ?? DateTime.now();

  int get likeCount => likedUsers.length;

  void toggleLike(String currentUserId) {
    if (likedUsers.contains(currentUserId)) {
      likedUsers.remove(currentUserId);
    } else {
      likedUsers.add(currentUserId);
    }
  }
}
