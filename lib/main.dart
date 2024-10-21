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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const Header(),
        body: Consumer<CurrentPageProvider>(
          builder: (context, currentPageProvider, child) {
            return [
              const MainPage(),
              const ProjectPage(),
              const PostPage(),
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
    // final ThemeData theme = Theme.of(context);
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset('image/home.svg'),
          label: '',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('image/project.svg'),
          label: '',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('image/chat.svg'),
          label: '',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            width: 45,
            'image/profile.svg',
          ),
          label: '',
        )
      ],
      onDestinationSelected: (index) {
        Provider.of<CurrentPageProvider>(context, listen: false)
            .setCurrentPage(index);
      },
      selectedIndex: Provider.of<CurrentPageProvider>(context).currentPage,
    );
  }
}
