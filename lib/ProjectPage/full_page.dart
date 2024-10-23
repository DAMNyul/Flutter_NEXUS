import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullPage extends StatelessWidget {
  const FullPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final double boxSize = screenSize.width * 0.25;
    final double topPosition = screenSize.height * 0.1;
    final double leftPosition = screenSize.width * 0.07;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Nexus',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
            top: 90,
            left: 150,
            child: Text(
              "NEXUS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Positioned(
            top: 120,
            left: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 13,
                      color: Color(0xffFF9900),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "모집중",
                      style: TextStyle(
                        color: Color(
                          0xff757575,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "이세민 외 5명",
                  style: TextStyle(
                    color: Color(
                      0xff757575,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: topPosition,
            left: leftPosition,
            child: SizedBox(
              width: boxSize,
              height: boxSize,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(0xFFFFF7E3),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'image/project.svg',
                    color: const Color(0xffFF9900),
                    width: boxSize * 0.65,
                    height: boxSize * 0.65,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 230,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "인원 모집",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 240,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        _buildRow("모집 분야", "FrontEnd"),
                        const SizedBox(height: 10),
                        _buildRow("모집 인원", "2인"),
                        const SizedBox(height: 10),
                        _buildRow("지원 자격", ""),
                        _buildCustomRow(
                          svgPath: 'image/javaScript.svg',
                          textColor: Colors.blue,
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          textValue: "JavaScript",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 10),
          if (value.isNotEmpty)
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
        ],
      ),
    );
  }
}

Widget _buildCustomRow({
  required String svgPath,
  required Color textColor,
  required Color backgroundColor,
  required String textValue,
}) {
  return Container(
    width: 70,
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7),
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          svgPath,
          width: 10, // 원하는 크기로 조정
          height: 10, // 원하는 크기로 조정
        ),
        const SizedBox(width: 3),
        Text(
          textValue,
          style: TextStyle(color: textColor, fontSize: 10), // 텍스트 크기 조정
        ),
      ],
    ),
  );
}
