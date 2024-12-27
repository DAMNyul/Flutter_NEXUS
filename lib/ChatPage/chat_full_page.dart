import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatFullPage extends StatefulWidget {
  const ChatFullPage({super.key});

  @override
  State<ChatFullPage> createState() => _ChatFullPageState();
}

class _ChatFullPageState extends State<ChatFullPage> {
  final TextEditingController textController = TextEditingController();
  List<String> messages = []; // 메시지 목록

  @override
  void initState() {
    super.initState();
    _loadMessages(); // 메시지 목록 로드
  }

  // 저장된 메시지를 SharedPreferences에서 불러오기
  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // 저장된 메시지를 가져와 messages 리스트에 할당
      messages = prefs.getStringList('messages') ?? [];
    });
  }

  // 메시지를 SharedPreferences에 저장
  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('messages', messages); // 메시지를 저장
  }

  // 입력된 메시지를 저장하고 화면을 업데이트
  void saveInputValue() {
    setState(() {
      if (textController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('메시지를 작성해주세요!'),
          ),
        );
        return;
      }
      messages.add(textController.text);
      textController.clear(); // 입력 필드 초기화
    });
    _saveMessages(); // 메시지 저장
  }

  // 메시지 삭제
  void deleteMessage(int index) {
    setState(() {
      messages.removeAt(index); // 특정 인덱스의 메시지를 삭제
    });
    _saveMessages(); // 변경 사항 저장
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
              'Username1',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로 가기 전에 메시지를 저장
            _saveMessages();
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),
      resizeToAvoidBottomInset: true, // 키보드가 화면을 가리지 않도록 설정
      body: SafeArea(
        child: Column(
          children: [
            // 입력된 메시지를 화면에 표시
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE3E3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                messages[index],
                                style: const TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteMessage(index); // 메시지 삭제
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // 텍스트 필드
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
                        hintText: '메시지를 입력하세요',
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
