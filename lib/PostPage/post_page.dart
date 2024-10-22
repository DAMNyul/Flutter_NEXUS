import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
