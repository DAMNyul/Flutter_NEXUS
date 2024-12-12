import 'package:flutter/material.dart';

class CurrentPageProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;
  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}

class PostProvider extends ChangeNotifier {
  final List<Map<String, String>> _posts = [
    {"title": "제목 1", "content": "내용 1"},
    {"title": "제목 2", "content": "내용 2"},
  ];

  List<Map<String, String>> get posts => _posts;

  void addPost(String title, String content) {
    _posts.add({"title": title, "content": content});
    notifyListeners(); // 상태 변경 알림
  }
}
