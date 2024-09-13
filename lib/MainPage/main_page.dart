import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TextField의 입력 값을 관리할 TextEditingController 생성
  final TextEditingController _textController = TextEditingController();

  // 입력된 값을 저장하는 메서드
  void _saveInputValue() {
    // 컨트롤러에서 현재 텍스트를 가져옵니다.
    String inputValue = _textController.text;
    // 입력 값을 출력하거나 다른 곳에 저장하는 작업을 수행
    print('입력된 값: $inputValue'); // 입력 값을 출력

    _textController.clear();
  }

  @override
  void dispose() {
    // 화면이 사라질 때 컨트롤러를 해제
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
                  )),
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
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 100,
            child: Container(
              width: 200,
              height: 25, // 컨테이너 높이 유지
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
                controller: _textController, // TextEditingController 연결
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
                onSubmitted: (_) => _saveInputValue(), // 입력 완료 시 값 저장
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_home_work_rounded,
            ),
          )
        ],
      ),
    );
  }
}
