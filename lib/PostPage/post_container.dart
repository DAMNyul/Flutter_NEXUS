import 'package:flutter/material.dart';
import 'package:flutter_nexus/PostPage/post_full_page.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center로 감싸기
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.75, // 넓이 조정
        height: MediaQuery.of(context).size.height * 0.1,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                ),
                Text(
                  "임시로 만든 제목입니다. 냠냠굿 | 송재욱",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                "임시로 적는 본문입니다. 이 글이 중간 발표때까지 살아남을지 의문스럽습니다. 저는 프론트엔드 개발을 하려고 했는데 왜 유아이유엑스 디자인을 하고 있는지 아직도 잘 모르겠습니다. 그런데 디자인이 꽤 재밌다는 사실을 여러분은 알고 계셨나요?",
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartyOfPostContainer extends StatelessWidget {
  const PartyOfPostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostFullPage()),
                );
              },
              child: const PostContainer(),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostFullPage()),
                );
              },
              child: const PostContainer(),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostFullPage()),
                );
              },
              child: const PostContainer(),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
