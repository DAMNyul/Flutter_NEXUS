import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    print('입력된 값: $inputValue'); // db 연결
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
    // 화면의 크기를 가져오기 위한 MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.menu_sharp, // 나중에 추가 기능 구현(누르면 탭 나오는 기능)
              size: screenWidth * 0.08, // 반응형 크기
            ),
            SizedBox(
              width: screenWidth * 0.03, // 반응형 여백
            ),
            Text(
              'NEXUS',
              style: TextStyle(
                fontSize: screenWidth * 0.05, // 반응형 폰트 크기
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        // SafeArea 추가
        child: Stack(
          children: [
            // 반응형으로 Container 배치
            Positioned(
              top: screenHeight * 0.2,
              left: screenWidth * 0.7, // 조정된 left 값
              child: Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.15,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF5DB),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.05, // 음수 값 제거 및 조정
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F9FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: screenHeight * 0.1,
                width: screenWidth * 0.9,
              ),
            ),
            Positioned(
              top: screenHeight * 0.175,
              left: screenWidth * 0.1,
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.23,
              left: screenWidth * 0.3,
              child: Container(
                width: screenWidth * 0.6,
                height: screenHeight * 0.04,
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
                  decoration: InputDecoration(
                    hintText: "Search",
                    isCollapsed: true,
                    contentPadding: EdgeInsets.only(
                      left: screenWidth * 0.02, // 반응형 패딩
                      right: screenWidth * 0.02,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      size: screenWidth * 0.05, // 반응형 아이콘 크기
                      color: Theme.of(context).primaryColor, // 아이콘 색상 통일
                    ),
                  ),
                  style: TextStyle(fontSize: screenWidth * 0.035), // 반응형 텍스트 크기
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (_) => _saveInputValue(),
                  onEditingComplete: _saveInputValue,
                ),
              ),
            ),
          ],
        ),
      ),
      // 하단 네비게이션 바 추가
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/image/home.svg',
              height: screenHeight * 0.03, // 반응형 아이콘 높이
              width: screenWidth * 0.07, // 반응형 아이콘 너비
              color: _selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey, // 선택에 따른 색상 변경
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/image/project.svg',
              height: screenHeight * 0.03,
              width: screenWidth * 0.07,
              color: _selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            label: 'Project',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/image/project.svg',
              height: screenHeight * 0.03,
              width: screenWidth * 0.07,
              color: _selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            label: 'Project',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/image/profile.svg',
              height: screenHeight * 0.03,
              width: screenWidth * 0.07,
              color: _selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // 선택된 아이템 인덱스
        selectedItemColor: Theme.of(context).primaryColor, // 선택된 아이템 색상 통일
        unselectedItemColor: Colors.grey, // 미선택 아이템 색상
        onTap: _onItemTapped, // 아이템 선택 시 호출될 메서드
        type: BottomNavigationBarType.fixed, // 아이템 수가 3개 이상일 때 필요
      ),
    );
  }
}
