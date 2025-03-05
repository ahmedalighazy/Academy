// ملف main.dart
import 'package:acadmy/Auth/login.dart';
import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:acadmy/HomeScreen/Subject/SubjectStu.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:acadmy/HomeScreen/profile/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart'; // استيراد الحزمة

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(apiKey: 'AIzaSyCbx2AnWpURWEO5wegQyLkGXXn-_ChLBZg');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        HomeTab.routeName: (context) => HomeTab(),
        SubjectStu.routeName: (context) => SubjectStu(),
        ChatStu.routeName: (context) => ChatStu(),
        Profile.routeName: (context) => Profile(),
        Login.routeName: (context) => Login(),
        RegisterScreen.routeName: (context) => RegisterScreen()
      },
    );
  }
}