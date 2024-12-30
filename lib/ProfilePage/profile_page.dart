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
  int following = 0; // Following 값

  @override
  void initState() {
    super.initState();
    _loadFollowingState(); // Following 상태 로드
  }

  // SharedPreferences에서 Following 상태 로드
  Future<void> _loadFollowingState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      following = prefs.getInt('Follower') ?? 0; // Follower 값으로 설정
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(100, 50),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                ),
                color: Color(0xfff4f9ff),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              width: screenWidth * 0.80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.5,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Center(
                        child: Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xfff4f9ff),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  "Follower",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.1,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xfff4f9ff),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Following",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "$following", // Following 값 표시
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // Projects Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Projects",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            height: 200, // 고정된 높이로 설정
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FullPageCollecting()),
                                    );
                                  },
                                  child: const NexusCardCollecting(),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FullPageCollecting()),
                                    );
                                  },
                                  child: const NexusCardCollecting(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    // Posts Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Posts",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            height: 200, // 고정된 높이로 설정
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                PostContainer(
                                  post: Post(
                                    id: '1',
                                    title: 'Post Title 1',
                                    content: 'This is the content of post 1.',
                                    author: 'Author 1',
                                    createdAt: DateTime.now(),
                                    likeCount: 10,
                                    comments: [],
                                    likedUsers: {},
                                  ),
                                  currentUserId: 'currentUserId',
                                ),
                                SizedBox(
                                  width: screenWidth * 0.05,
                                ),
                                PostContainer(
                                  post: Post(
                                    id: '2',
                                    title: 'Post Title 2',
                                    content: 'This is the content of post 2.',
                                    author: 'Author 2',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'image/profile.svg',
            height: 200,
          ),
        ],
      ),
    );
  }
}
