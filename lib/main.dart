import 'package:flutter/material.dart';
import 'package:flutter_nexus/MainPage/main_page.dart';
import 'package:flutter_nexus/PostPage/post_page.dart';
import 'package:flutter_nexus/ProfilePage/profile_page.dart';
import 'package:flutter_nexus/ProjectPage/project_page.dart';
import 'package:flutter_nexus/provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CurrentPageProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 예시 데이터
  final List<Map<String, String>> posts = [
    {"title": "제목 1", "content": "내용 1"},
    {"title": "제목 2", "content": "내용 2"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const Header(),
        body: Consumer<CurrentPageProvider>(
          builder: (context, currentPageProvider, child) {
            // PostPage를 띄울 때 posts를 전달해줍니다.
            return [
              const MainPage(),
              const ProjectPage(),
              PostPage(posts: posts), // PostPage에 posts 전달
              const ProfilePage(),
            ][currentPageProvider.currentPage];
          },
        ),
        bottomNavigationBar: const FootNavigator(),
      ),
    );
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          Text(
            'Nexus',
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FootNavigator extends StatefulWidget {
  const FootNavigator({super.key});

  @override
  _FootNavigatorState createState() => _FootNavigatorState();
}

class _FootNavigatorState extends State<FootNavigator> {
  @override
  Widget build(BuildContext context) {
    final int selectedIndex =
        Provider.of<CurrentPageProvider>(context).currentPage;
    const double homeAndOtherBaseSize = 25; // 다른 아이콘의 기본 크기
    const double profileBaseSize = 50; // 프로필 아이콘의 기본 크기
    const double scaleFactor = 1.2; // 선택된 아이콘 크기 비율

    return NavigationBar(
      backgroundColor: Colors.white,
      destinations: [
        NavigationDestination(
          selectedIcon: _buildAnimatedIcon('image/clicked_home.svg',
              selectedIndex == 0, homeAndOtherBaseSize, scaleFactor),
          icon: _buildAnimatedIcon('image/home.svg', selectedIndex == 0,
              homeAndOtherBaseSize, scaleFactor),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: _buildAnimatedIcon('image/clicked_project.svg',
              selectedIndex == 1, homeAndOtherBaseSize, scaleFactor),
          icon: _buildAnimatedIcon('image/project.svg', selectedIndex == 1,
              homeAndOtherBaseSize, scaleFactor),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: _buildAnimatedIcon('image/clicked_chat.svg',
              selectedIndex == 2, homeAndOtherBaseSize, scaleFactor),
          icon: _buildAnimatedIcon('image/chat.svg', selectedIndex == 2,
              homeAndOtherBaseSize, scaleFactor),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: _buildAnimatedIcon('image/clicked_profile.svg',
              selectedIndex == 3, profileBaseSize, scaleFactor),
          icon: _buildAnimatedIcon('image/profile.svg', selectedIndex == 3,
              profileBaseSize, scaleFactor),
          label: '',
        ),
      ],
      onDestinationSelected: (index) {
        Provider.of<CurrentPageProvider>(context, listen: false)
            .setCurrentPage(index);
      },
      selectedIndex: selectedIndex,
      indicatorColor: Colors.transparent,
    );
  }

  Widget _buildAnimatedIcon(
      String assetPath, bool isSelected, double baseSize, double scaleFactor) {
    double iconSize = isSelected ? baseSize * scaleFactor : baseSize;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: iconSize,
      height: iconSize,
      child: SvgPicture.asset(
        assetPath,
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
