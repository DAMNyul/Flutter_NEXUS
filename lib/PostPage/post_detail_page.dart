import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final String title;
  final String content;
  final String author;
  final DateTime dateTime;
  final int likes;
  final List<String> comments;

  const PostDetailPage({
    super.key,
    required this.title,
    required this.content,
    required this.author,
    required this.dateTime,
    required this.likes,
    required this.comments,
  });

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late int currentLikes;
  late List<String> currentComments;
  final TextEditingController _commentController = TextEditingController();
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    currentLikes = widget.likes;
    currentComments = List.from(widget.comments);
  }

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        currentLikes--;
      } else {
        currentLikes++;
      }
      isLiked = !isLiked;
    });
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        currentComments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * -0.3,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFF7E3),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.width * -0.3,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFF7E3),
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Container(
                width: 300,
                height: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 70,
                      ),
                      child: Text(
                        widget.content,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            child: Container(
              width: 200, // 너비 조정
              height: 100, // 높이 조정
              decoration: BoxDecoration(
                color: const Color(0xFFDEFFEE), // 배경 색상
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(100), // 각 모서리의 둥근 정도 조정
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // 그림자 색상
                    spreadRadius: 1, // 그림자 퍼짐 정도
                    blurRadius: 5, // 그림자 흐림 정도
                    offset: const Offset(2, 3), // 그림자 위치
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.author,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text('')
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 250,
            top: 400,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color(0xFFDEFFEE),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  width: 40,
                  height: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                        Text('${widget.likes}'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 20,
                  width: 40,
                  height: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_outlined,
                          color: Colors.grey,
                        ),
                        Text('${widget.comments}'),
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

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
