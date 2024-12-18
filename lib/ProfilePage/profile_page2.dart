import 'package:flutter/material.dart';
import 'package:flutter_nexus/ChatPage/chat_full_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  bool isFollowed = false;
  int Follower = 0;
  int Following = 0;

  @override
  void initState() {
    super.initState();
    _loadFollowState();
  }

  // Load saved state from SharedPreferences
  Future<void> _loadFollowState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFollowed = prefs.getBool('isFollowed') ?? false;
      Follower = prefs.getInt('Follower') ?? 0;
    });
  }

  // Save follow state to SharedPreferences
  Future<void> _saveFollowState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFollowed', isFollowed);
    prefs.setInt('Follower', Follower);
  }

  void clickFollowButton() {
    setState(() {
      isFollowed = !isFollowed;
      if (isFollowed) {
        Follower++;
      } else {
        Follower--;
      }
      _saveFollowState();
    });
  }

  void clickMessageButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatFullPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    String FollowerCount = Follower.toString();
    String FollowingCount = Following.toString();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Nexus',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
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
              width: MediaQuery.of(context).size.width * 0.80,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        children: [
                          const Text(
                            "Username1",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  child: ElevatedButton(
                                    onPressed: clickFollowButton,
                                    child: Text(
                                        isFollowed ? "Following" : "Follow"),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  child: ElevatedButton(
                                    onPressed: clickMessageButton,
                                    child: const Text("Message"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xfff4f9ff),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Follower",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  FollowerCount,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
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
                                  FollowingCount,
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0x5fe76f00),
                            ),
                            width: 100,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'image/java.svg',
                                  width: 27,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Java",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffe76f00),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0x5f70AD51),
                            ),
                            width: 150,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'image/spring.svg',
                                  width: 27,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Spring",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff70AD51),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
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
