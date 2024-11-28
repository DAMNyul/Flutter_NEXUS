import 'package:flutter/material.dart';
import 'post_container.dart'; // PartyOfPostContainer와 관련된 코드 임포트

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  List<Map<String, String>> posts = [];

  void _uploadPost() {
    String title = titleController.text;
    String content = contentController.text;

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('제목과 내용을 모두 작성해주세요!')),
      );
      return;
    }

    setState(() {
      posts.add({'title': title, 'content': content});
    });

    // 포스트 업로드 후 PartyOfPostContainer로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PartyOfPostContainer(posts: posts),
      ),
    );

    // 입력 필드 비우기
    titleController.clear();
    contentController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('포스트가 성공적으로 업로드되었습니다!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Create Post',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('제목',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      TextField(
                          controller: titleController,
                          decoration: InputDecoration(hintText: '제목 작성')),
                      const SizedBox(height: 20),
                      const Text('내용',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      TextField(
                          controller: contentController,
                          maxLines: 4,
                          decoration: InputDecoration(hintText: '내용 작성')),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _uploadPost,
                        child: const Text('포스트 업로드'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
