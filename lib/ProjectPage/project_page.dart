import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NexusCard extends StatelessWidget {
  const NexusCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double cardWidth = screenWidth * 0.386;
    double cardHeight = cardWidth * (212 / 160);

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2,
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00DA71).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'image/project.svg',
              width: cardWidth * 0.25,
              height: cardWidth * 0.25,
              color: const Color(0xFF00DA71),
            ),
          ),
          const SizedBox(height: 12),

          // NEXUS 텍스트
          Text(
            "NEXUS",
            style: TextStyle(
              fontSize: cardWidth * 0.1,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: cardWidth * 0.06,
                color: Colors.green,
              ),
              const SizedBox(width: 5),
              Text(
                "진행중",
                style: TextStyle(
                  fontSize: cardWidth * 0.07,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            "이세민 외 5명",
            style: TextStyle(
              fontSize: cardWidth * 0.06,
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * -0.3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffDAE9FF),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            right: MediaQuery.of(context).size.width * -0.3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffDAE9FF),
                ),
              ),
            ),
          ),
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
