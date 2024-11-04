import 'package:flutter/material.dart';

class PostFullPage extends StatelessWidget {
  const PostFullPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
          // 첫 번째 원
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * -0.3, // 위치 조정
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFFFFF7E3),
                ),
              ),
            ),
          ),
          // 두 번째 원
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            right: MediaQuery.of(context).size.width * -0.3, // 위치 조정
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFFF7E3),
                ),
              ),
            ),
          ),
          // 중앙 박스
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff4f9ff),
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Text(
                    "임시로 만든 제목입니다. 냠냠굿 | 송재욱",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "임시로 적는 본문입니다. 이 글이 중간 발표때까지 살아남을지 의문스럽습니다. 저는 프론트엔드 개발을 하려고 했는데 왜 유아이유엑스 디자인을 하고 있는지 아직도 잘 모르겠습니다. 그런데 디자인이 꽤 재밌다는 사실을 여러분은 알고 계셨나요?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
