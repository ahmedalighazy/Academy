import 'package:acadmy/resources_app/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatStu extends StatefulWidget {
  static const String routeName = 'chat';
  const ChatStu({super.key});

  @override
  State<ChatStu> createState() => _ChatStuState();
}

class _ChatStuState extends State<ChatStu> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;
  final Gemini _gemini = Gemini.instance;

  // List of colors related to study theme
  final List<Color> appBarColors = [
    Color(0xFF3598DB), // Sky Blue
  ];

  // Randomly pick an AppBar color
  Color getRandomColor() {
    return appBarColors[(DateTime.now().millisecond) % appBarColors.length];
  }

  Future<void> _fetchAiResponse(String prompt) async {
    try {
      await _gemini.text(prompt).then((response) {
        if (response != null && response.output != null) {
          _addAiMessage(response.output!);
        } else {
          _addAiMessage("لم يتم العثور على إجابة");
        }
      });
    } catch (e) {
      _addAiMessage("حدث خطأ: ${e.toString()}");
    }
  }

  void _addAiMessage(String message) {
    if (!mounted) return;
    setState(() {
      _messages.add({'sender': 'ai', 'message': message});
      _isLoading = false;
    });
  }

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'student', 'message': _controller.text});
      _isLoading = true;
      _controller.clear();
    });

    _fetchAiResponse(_messages.last['message']!);
  }

  // دالة لإعادة تحميل الصفحة
  void _refreshPage() {
    setState(() {
      _messages.clear(); // مسح جميع الرسائل
      _isLoading = false; // إعادة تعيين حالة التحميل
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: ColorManager.white)),
        title: const Text(
          "Chat AI",
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: getRandomColor(), // تغيير لون AppBar بشكل عشوائي
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _refreshPage, // استدعاء دالة إعادة التحميل عند الضغط
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // تعيين لون الخلفية إلى الأبيض
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['sender'] == 'student'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'student'
                            ? Colors.blueAccent // رسائل الطالب باللون الأزرق
                            : Colors.grey[300], // رسائل الذكاء الاصطناعي باللون الرمادي
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // ظل ناعم
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(
                          color: message['sender'] == 'student'
                              ? Colors.white
                              : Colors.black87,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  color: Colors.blue, // لون مؤشر التحميل يتناسب مع سمة التطبيق
                  minHeight: 4, // ضبط ارتفاع المؤشر
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // خلفية رمادية ناعمة لمنطقة الإدخال
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54, // ظل خفيف لإبراز المنطقة
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: '...اكتب رسالتك',
                          hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: _sendMessage,
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