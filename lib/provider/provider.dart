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
    return List<Post>.from(_posts)
      ..sort((a, b) {
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
    } else {
      debugPrint('Post with ID $postId not found.');
    }
  }

  void addPost(String title, String content, String author) {
    if (title.isEmpty || content.isEmpty) {
      debugPrint('Title and content cannot be empty.');
      return;
    }

    final newPost = Post(
      id: DateTime.now().toIso8601String(), // 고유 ID 생성
      title: title,
      content: content,
      author: author.isNotEmpty ? author : '송재욱',
      likeCount: 20, // 기본 작성자 설정
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
