import 'package:flutter/material.dart';
import 'package:flutter_nexus/models/post_models.dart';

class CurrentPageProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}

class PostProvider extends ChangeNotifier {
  final List<Post> _posts = [];

  List<Post> get posts {
    // 좋아요 수 내림차순, 같을 경우 최신 순으로 정렬
    return _posts.sorted((a, b) {
      int likeComparison = b.likeCount.compareTo(a.likeCount);
      if (likeComparison != 0) return likeComparison;
      return b.createdAt.compareTo(a.createdAt);
    });
  }

  void togglePostLike(String postId, String currentUserId) {
    final postIndex = _posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      _posts[postIndex].toggleLike(currentUserId);
      notifyListeners();
    }
  }

  void addPost(String title, String content, String author) {
    final newPost = Post(
      id: DateTime.now().toIso8601String(), // 고유 ID 생성
      title: title,
      content: content,
      author: author, // 작성자 이름 추가
    );

    _posts.add(newPost);
    notifyListeners(); // 변경 사항 알림
  }
}

extension on List<Post> {
  List<Post> sorted(int Function(Post a, Post b) compare) {
    final List<Post> sortedList = List<Post>.from(this);
    sortedList.sort(compare);
    return sortedList;
  }
}
