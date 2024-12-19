import 'package:flutter/material.dart';

class ChatFullPage extends StatelessWidget {
  const ChatFullPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'username1',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // 여기에 다른 콘텐츠가 추가될 수 있습니다
          Positioned(
            height: MediaQuery.of(context).size.height * 1.63,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: '메시지를 입력하세요',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
