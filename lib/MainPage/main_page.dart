import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              child: const TextField(
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    size: 18,
                  ),
                ),
                style: TextStyle(fontSize: 14),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
