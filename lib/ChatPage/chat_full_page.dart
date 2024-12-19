import 'package:flutter/material.dart';

class ChatFullPage extends StatefulWidget {
  const ChatFullPage({super.key});

  @override
  State<ChatFullPage> createState() => _ChatFullPageState();
}

class _ChatFullPageState extends State<ChatFullPage> {
  final TextEditingController textController = TextEditingController();
  String displayedMessage = '';

  void saveInputValue() {
    setState(() {
      displayedMessage = textController.text; // 입력값 저장
      textController.clear(); // 입력 필드 초기화
    });
  }

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
              'username1',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
      // 키보드가 화면을 가리지 않도록 설정
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // 입력된 메시지를 화면에 표시
            if (displayedMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      displayedMessage,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            // 남은 공간과 텍스트 필드를 조정
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        hintText: '메시지를 입력하세요',
                        suffixIcon: IconButton(
                          onPressed: saveInputValue,
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
