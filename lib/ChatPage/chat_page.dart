import 'package:flutter/material.dart';
import 'package:flutter_nexus/ChatPage/chat_full_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  bool showContainer = false; // 컨테이너 표시 여부를 저장

  void _saveInputValue() {
    String inputValue = _textController.text;
    setState(() {
      // 입력값이 "username1"일 때만 컨테이너 표시
      showContainer = inputValue == "username1" || inputValue == "Username1";
    });
    _textController.clear(); // 입력 필드 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "검색",
                      ),
                      onSubmitted: (value) {
                        _saveInputValue(); // 입력값을 처리
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 조건부로 컨테이너 표시
          if (showContainer)
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatFullPage(),
                    ),
                  );
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.175,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.62,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "images/profile.svg",
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Username1",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
