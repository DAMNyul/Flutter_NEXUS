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

  void addPost(result, result2, String currentUserId) {}
}

extension on List<Post> {
  List<Post> sorted(Function(dynamic a, dynamic b) param0) {}
}
