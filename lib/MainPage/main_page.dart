import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NexusCard extends StatelessWidget {
  const NexusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // 외각선 색상
          width: 2, // 외각선 두께
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 아이콘 부분
          Container(
            padding: const EdgeInsets.all(10), // 패딩을 줄임
            decoration: BoxDecoration(
              color: const Color(0xFF00DA71).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'image/project.svg',
              width: 40, // 아이콘 크기를 줄임
              height: 40,
              color: const Color(0xFF00DA71),
            ),
          ),
          const SizedBox(height: 12), // 간격 조정

          // NEXUS 텍스트
          const Text(
            "NEXUS",
            style: TextStyle(
              fontSize: 16, // 폰트 크기를 줄임
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8), // 간격 조정

          // 진행중 상태 텍스트
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 10, // 아이콘 크기를 줄임
                color: Colors.green,
              ),
              SizedBox(width: 5),
              Text(
                "진행중",
                style: TextStyle(
                  fontSize: 11, // 폰트 크기를 줄임
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24), // 간격 조정

          // 하단 텍스트
          const Text(
            "이세민 외 5명",
            style: TextStyle(
              fontSize: 10, // 폰트 크기를 줄임
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();
  String userInput = ""; // 사용자의 입력을 저장할 변수

  void _saveInputValue() {
    // 입력 값을 처리하는 로직
    String inputValue = _textController.text;
    print(inputValue); // 예: 입력값을 출력
    // 여기서 원하는 로직을 추가할 수 있습니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 85),
                child: Positioned(
                  height: MediaQuery.of(context).size.height * 0.325,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: 350,
                    height: 150,
                    child: Transform.translate(
                      offset: const Offset(160, 65),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFFF5DB),
                        ),
                        width: 120,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.325,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 85),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF4F9FF),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: 315,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              width: 250,
                              height: 45,
                              child: TextField(
                                controller: _textController,
                                decoration: const InputDecoration(
                                  hintText: "Search",
                                  contentPadding:
                                      EdgeInsets.only(left: 8, right: 8),
                                  border: InputBorder.none,
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 18,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 14),
                                textAlignVertical: TextAlignVertical.center,
                                onChanged: (value) {
                                  setState(() {
                                    userInput = value; // 사용자가 입력하는 텍스트를 저장
                                  });
                                },
                                onSubmitted: (value) {
                                  _saveInputValue(); // 입력값을 저장하고 다른 처리를 수행
                                  _textController.clear(); // 입력 필드 초기화
                                  setState(
                                    () {
                                      userInput = ""; // 입력 값을 초기화
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(-70, 0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  clipBehavior: Clip.none,
                  decoration: const BoxDecoration(
                    color: Color(0xffF4F9FF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  width: 210,
                  height: 270,
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 20,
                            ),
                          ),
                          Text(
                            "Best Project",
                            style: TextStyle(
                              fontSize: 17.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            NexusCard(),
                            SizedBox(width: 10),
                            NexusCard(),
                            SizedBox(width: 10),
                            NexusCard(),
                            SizedBox(width: 10),
                            NexusCard(),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
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
