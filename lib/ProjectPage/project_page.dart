import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NexusCard extends StatelessWidget {
  const NexusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 212,
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

class TwoOfNexusCard extends StatelessWidget {
  const TwoOfNexusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            NexusCard(),
            SizedBox(
              width: 25,
            ),
            NexusCard(),
          ],
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }
}

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                Column(
                  children: [
                    TwoOfNexusCard(),
                    TwoOfNexusCard(),
                    TwoOfNexusCard(),
                    TwoOfNexusCard(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
