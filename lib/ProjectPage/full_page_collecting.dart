import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullPageCollecting extends StatelessWidget {
  const FullPageCollecting({super.key});

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
          Positioned(
            top: screenSize.height * 0.1,
            left: screenSize.width * 0.4,
            child: Text(
              "NEXUS",
              style: TextStyle(
                fontSize: screenSize.width * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.13,
            left: screenSize.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: screenSize.width * 0.035,
                      color: const Color(0xffFF9900),
                    ),
                    SizedBox(width: screenSize.width * 0.01),
                    Text(
                      "모집중",
                      style: TextStyle(
                        color: const Color(0xff757575),
                        fontSize: screenSize.width * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),
                Text(
                  "이세민 외 5명",
                  style: TextStyle(
                    color: const Color(0xff757575),
                    fontSize: screenSize.width * 0.03,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: topPosition,
            left: leftPosition,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenSize.width * 0.025),
                color: const Color(0xFFFFF7E3),
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
          Positioned(
            top: screenSize.height * 0.3,
            left: screenSize.width * 0.07,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "인원 모집",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Container(
                  width: screenSize.width * 0.65,
                  padding: EdgeInsets.all(screenSize.width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: screenSize.width * 0.005,
                        blurRadius: screenSize.width * 0.02,
                        offset: Offset(0, screenSize.height * 0.01),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.015),
                      _buildRow("모집 분야", "FrontEnd", screenSize),
                      SizedBox(height: screenSize.height * 0.015),
                      _buildRow("모집 인원", "2인", screenSize),
                      SizedBox(height: screenSize.height * 0.015),
                      _buildRow("지원 자격", "", screenSize),
                      SizedBox(height: screenSize.height * 0.01),
                      Row(
                        children: [
                          _buildCustomRow(
                            svgPath: 'image/javaScript.svg',
                            textColor: const Color(0xffF7DF1E),
                            backgroundColor:
                                const Color(0xffF7DF1E).withOpacity(0.1),
                            textValue: "JavaScript",
                            screenSize: screenSize,
                          ),
                          SizedBox(width: screenSize.width * 0.05),
                          _buildCustomRow(
                            svgPath: 'image/react.svg',
                            textColor: const Color(0xff00D8FF),
                            backgroundColor:
                                const Color(0xff00D8FF).withOpacity(0.1),
                            textValue: "React",
                            screenSize: screenSize,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height * 0.6,
            left: screenSize.width * 0.07,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "프로젝트 소개",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.015),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.025),
                  child: SizedBox(
                    width: screenSize.width * 0.8,
                    child: Text(
                      "예시로 쓰는 프로젝트 소개입니다. 플러터 이 새기 말은 진짜 더럽게 안 듣는데 바라는건 또 더럽게 많아서 뭐 하나 하려고 하면 에러 3개씩 띄우니까 진짜 그냥 하기가 싫어버리지만 그래도 열심히 해야하지 않겠습니까? 냠냠굿 키보드로 무언갈 계속 쳤다간 선생님에게 디스코드 하는걸로 오해받을것 같으니 여기서 그만하겠습니다.",
                      style: TextStyle(fontSize: screenSize.width * 0.035),
                      softWrap: true,
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

  Widget _buildRow(String label, String value, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontSize: screenSize.width * 0.04)),
          SizedBox(width: screenSize.width * 0.02),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(
                fontSize: screenSize.width * 0.04,
                fontWeight: FontWeight.w600,
              ),
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
  required Size screenSize,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: screenSize.width * 0.01,
      horizontal: screenSize.width * 0.02,
    ),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(screenSize.width * 0.02),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          svgPath,
          width: screenSize.width * 0.03,
          height: screenSize.width * 0.03,
        ),
        SizedBox(width: screenSize.width * 0.01),
        Text(
          textValue,
          style:
              TextStyle(color: textColor, fontSize: screenSize.width * 0.025),
        ),
      ],
    ),
  );
}
