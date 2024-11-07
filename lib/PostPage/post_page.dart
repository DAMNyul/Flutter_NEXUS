import 'package:flutter/material.dart';
import 'package:flutter_nexus/PostPage/post_container.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
          ListView(
            scrollDirection: Axis.vertical,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              PartyOfPostContainer(),
              PartyOfPostContainer(),
              PartyOfPostContainer(),
              PartyOfPostContainer(),
              PartyOfPostContainer(),
            ],
          ),
        ],
      ),
    );
  }
}
