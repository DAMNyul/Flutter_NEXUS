import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_nexus/ProjectPage/nexus_card_collecting.dart';
import 'package:flutter_nexus/models/post_models.dart';
import 'package:flutter_nexus/ProjectPage/full_page_collecting.dart';
import 'package:flutter_nexus/PostPage/post_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int following = 234;
  int follower = 123;

  @override
  void initState() {
    super.initState();
    _loadFollowingState();
  }

  Future<void> _loadFollowingState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      following = prefs.getInt('Following') ?? 234;
      follower = prefs.getInt('Follower') ?? 123;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFF5F5F5), // 더 밝은 회색으로 변경
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFFDDDDDD), // 아이콘 색상을 더 밝게
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '송재욱',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Follower',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54, // 글자 색상을 더 연하게
                              ),
                            ),
                            Text(
                              '$follower',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          children: [
                            const Text(
                              'Following',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54, // 글자 색상을 더 연하게
                              ),
                            ),
                            Text(
                              '$following',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Projects Section
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 12),
            child: Text(
              'Projects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // 제목 색상 조정
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullPageCollecting(),
                      ),
                    );
                  },
                  child: const NexusCardCollecting(),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullPageCollecting(),
                      ),
                    );
                  },
                  child: const NexusCardCollecting(),
                ),
              ],
            ),
          ),

          // Posts Section
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 30, bottom: 12),
            child: Text(
              'Posts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // 제목 색상 조정
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                PostContainer(
                  post: Post(
                    id: '1',
                    title: '나 사실 개발자임',
                    content: '사실 나 프론트부터 백까지 다 혼자 할 수 있음 ㅋㅋㅋ...',
                    author: '송재욱',
                    createdAt: DateTime.now(),
                    likeCount: 10,
                    comments: [],
                    likedUsers: {},
                  ),
                  currentUserId: 'currentUserId',
                ),
                const SizedBox(height: 15),
                PostContainer(
                  post: Post(
                    id: '2',
                    title: '아니 넥서스',
                    content: '폼 미쳤네 ㅋㅋ아니 글쌔 어떤일이 있었냐면 ㅋㅋ 이거 ㄹㅇ ㅋㅋ 임...',
                    author: '송재욱',
                    createdAt: DateTime.now(),
                    likeCount: 20,
                    comments: [],
                    likedUsers: {},
                  ),
                  currentUserId: 'currentUserId',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
