import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NexusSearchBox extends StatefulWidget {
  const NexusSearchBox({super.key});

  @override
  _NexusSearchBoxState createState() => _NexusSearchBoxState();
}

class _NexusSearchBoxState extends State<NexusSearchBox> {
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
    return Stack(
      children: [
        Positioned(
          top: 140,
          left: 100,
          child: Container(
            width: 200,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: "Search",
                isCollapsed: true,
                contentPadding: EdgeInsets.only(left: 8, right: 8),
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
                setState(() {
                  userInput = ""; // 입력 값을 초기화
                });
              },
            ),
          ),
        ),
        // 입력된 값을 실시간으로 보여주는 Text 위젯 (옵션)
        Positioned(
          top: 170, // 텍스트 위치 조정
          left: 100,
          child: Text(userInput),
        ),
      ],
    );
  }
}

class NexusCard extends StatelessWidget {
  const NexusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // 카드 너비 (변경 없음)
      height: 212, // 카드 높이 (변경 없음)
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
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();
  int _selectedIndex = 0; // 현재 선택된 네비게이션 아이템 인덱스

  // 입력된 값을 저장하는 메서드
  void _saveInputValue() {
    String inputValue = _textController.text;
    print('입력된 값: $inputValue');
    _textController.clear();
  }

  // 네비게이션 아이템이 선택될 때 호출되는 메서드
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.menu_sharp,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'NEXUS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 145,
            left: 290,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF5DB),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: -10,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF4F9FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 81,
              width: 331,
            ),
          ),
          const Positioned(
            top: 110,
            left: 30,
            child: Text(
              "Search",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Positioned(
            child: NexusSearchBox(),
          ),
          Positioned(
            top: 300,
            left: -20,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 207,
                      height: 227,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F9FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 15,
                      left: 50,
                      child: Text(
                        "Best Project",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 10,
                      child: SizedBox(
                        width: 180,
                        height: 150, // 고정된 높이를 제공하여 레이아웃 문제 해결
                        child: ListView(
                          physics:
                              const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                          shrinkWrap: true, // 부모로부터 크기 제약을 받도록 설정
                          children: const [],
                        ),
                      ),
                    ),
                    const Positioned(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 55,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                NexusCard(),
                                SizedBox(width: 20), // 카드 간격
                                NexusCard(),
                                SizedBox(width: 20),
                                NexusCard(),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      // 하단 네비게이션 바 추가
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'image/home.svg',
              height: 24, // 아이콘 크기를 명시적으로 설정
              width: 24,
              placeholderBuilder: (BuildContext context) =>
                  const Icon(Icons.home), // SVG 로드 실패 시 대체 아이콘 표시
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'image/project.svg',
              height: 24, // 아이콘 크기를 명시적으로 설정
              width: 24,
              placeholderBuilder: (BuildContext context) => const Icon(
                  Icons.folder_copy_rounded), // SVG 로드 실패 시 대체 아이콘 표시
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'image/chat.svg',
              height: 24, // 아이콘 크기를 명시적으로 설정
              width: 24,
              placeholderBuilder: (BuildContext context) =>
                  const Icon(Icons.chat_rounded), // SVG 로드 실패 시 대체 아이콘 표시
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'image/profile.svg', //진짜 ㅠ유눔웁주웁쥬유
              height: 45, // 아이콘 크기를 명시적으로 설정
              width: 45,
              placeholderBuilder: (BuildContext context) =>
                  const Icon(Icons.people_alt), // SVG 로드 실패 시 대체 아이콘 표시
            ),
            label: '',
          )
        ],
        currentIndex: _selectedIndex, // 선택된 아이템 인덱스
        onTap: _onItemTapped,
      ),
    );
  }
}
