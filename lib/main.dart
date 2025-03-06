// ملف main.dart
import 'package:acadmy/Auth/first_screen.dart';
import 'package:acadmy/Auth/hive_preference_util.dart';
import 'package:acadmy/Auth/login.dart';
import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:acadmy/HomeScreen/Subject/SubjectStu.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:acadmy/HomeScreen/profile/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart'; // استيراد الحزمة

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await HivePreferenceUtil.init();
  Gemini.init(apiKey: 'AIzaSyCbx2AnWpURWEO5wegQyLkGXXn-_ChLBZg');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirstScreen.routeName,
      routes: {
        HomeTab.routeName: (context) => HomeTab(),
        SubjectStu.routeName: (context) => SubjectStu(),
        ChatStu.routeName: (context) => ChatStu(),
        ProfileForm.routeName: (context) => ProfileForm(),
        Login.routeName: (context) => Login(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        FirstScreen.routeName : (context) => FirstScreen()
      },
    );
  }
}