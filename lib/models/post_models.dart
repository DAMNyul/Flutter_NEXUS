class Post {
  String id;
  String title;
  String content;
  String author; // 작성자
  Set<String> likedUsers; // 좋아요 누른 사용자들
  DateTime createdAt; // 작성 시간
  List<String> comments; // 댓글 목록

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    Set<String>? likedUsers,
    DateTime? createdAt,
    List<String>? comments,
  })  : likedUsers = likedUsers ?? {},
        createdAt = createdAt ?? DateTime.now(),
        comments = comments ?? []; // 기본값으로 빈 리스트 설정

  int get likeCount => likedUsers.length;

  void toggleLike(String currentUserId) {
    if (likedUsers.contains(currentUserId)) {
      likedUsers.remove(currentUserId);
    } else {
      likedUsers.add(currentUserId);
    }
  }
}
