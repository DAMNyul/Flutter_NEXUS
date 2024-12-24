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
                height: 400,
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
