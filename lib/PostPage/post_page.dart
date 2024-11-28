import 'package:flutter/material.dart';
import 'package:flutter_nexus/PostPage/post_container.dart';
import 'package:flutter_nexus/PostPage/create_post_page.dart';

class PostPage extends StatefulWidget {
  final List<Map<String, String>> posts;

  const PostPage({super.key, required this.posts});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 배경 원들
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * -0.3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFFFFF7E3),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            right: MediaQuery.of(context).size.width * -0.3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFFF7E3),
                ),
              ),
            ),
          ),
          // PartyOfPostContainer로 포스트 리스트 전달
          PartyOfPostContainer(posts: widget.posts),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostPage(),
            ),
          ).then((newPost) {
            if (newPost != null) {
              setState(() {
                widget.posts.add(newPost);
              });
            }
          });
        },
        backgroundColor: const Color(0xffDAE9FF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
