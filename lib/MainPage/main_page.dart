import 'package:flutter/material.dart';

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
      _selectedIndex = index; // 선택된 아이템의 인덱스를 업데이트
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
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
                onSubmitted: (_) => _saveInputValue(),
              ),
            ),
          ),
        ],
      ),
      // 하단 네비게이션 바 추가
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // 선택된 아이템 인덱스
        onTap: _onItemTapped, // 아이템 선택 시 호출될 메서드
      ),
    );
  }
}
