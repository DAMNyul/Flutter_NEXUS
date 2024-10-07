import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();
  int _selectedIndex = 0;

  void _saveInputValue() {
    String inputValue = _textController.text;
    print('입력된 값: $inputValue');
    _textController.clear();
  }

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
            SizedBox(width: 10),
            Text(
              'NEXUS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 여백 추가
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            // 검색 영역
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F9FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      "Search",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      isCollapsed: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, size: 18),
                    ),
                    style: const TextStyle(fontSize: 14),
                    textAlignVertical: TextAlignVertical.center,
                    onSubmitted: (_) => _saveInputValue(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 120), // 검색 영역과 다음 영역 사이의 간격

            // 베스트 프로젝트 영역
            Container(
              width: double.infinity, // 전체 너비 사용
              height: 227,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F9FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Best Project",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(
                          title: Text(
                            "Test",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        // 추가 항목을 여기에 추가
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('image/home.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('image/project.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('image/chat.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 45,
              'image/profile.svg',
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
