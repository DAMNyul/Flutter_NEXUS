import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();
  String userInput = ""; // 사용자의 입력을 저장할 변수

  void _saveInputValue() {
    // 입력 값을 처리하는 로직
    String inputValue = _textController.text;
    print(inputValue); // 예: 입력값을 출력
    // 여기서 원하는 로직을 추가할 수 있습니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: 8, right: 8),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 18,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      setState(() {
                        userInput = value; // 사용자가 입력하는 텍스트를 저장
                      });
                    },
                    onSubmitted: (value) {
                      _saveInputValue(); // 입력값을 저장하고 다른 처리를 수행
                      _textController.clear(); // 입력 필드 초기화
                      setState(
                        () {
                          userInput = ""; // 입력 값을 초기화
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
