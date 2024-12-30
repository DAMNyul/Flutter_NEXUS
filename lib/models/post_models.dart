class Post {
  final String id;
  final String title;
  final String content;
  final String author;

  final Set<String> likedUsers;
  final DateTime createdAt;
  final List<String> comments;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    Set<String>? likedUsers,
    DateTime? createdAt,
    List<String>? comments,
    required int likeCount,
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
