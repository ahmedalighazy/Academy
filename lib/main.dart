import 'package:acadmy/Auth/first_screen.dart';
import 'package:acadmy/Auth/hive_preference_util.dart';
import 'package:acadmy/Auth/login.dart';
import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:acadmy/HomeScreen/Home_tech/HomeTech.dart';
import 'package:acadmy/HomeScreen/Subject/SubjectStu.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:acadmy/HomeScreen/profile/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart'; // استيراد الحزمة
import 'package:shared_preferences/shared_preferences.dart'; // استيراد SharedPreferences

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase
  await Firebase.initializeApp();

  // تهيئة Hive
  await Hive.initFlutter();
  await HivePreferenceUtil.init();

  // تهيئة SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // تهيئة Gemini API
  Gemini.init(apiKey: 'AIzaSyCbx2AnWpURWEO5wegQyLkGXXn-_ChLBZg');

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeTab.routeName,
      routes: {
        HomeTab.routeName: (context) => HomeTab(),
        SubjectStu.routeName: (context) => SubjectStu(),
        ChatStu.routeName: (context) => ChatStu(),
        ProfileForm.routeName: (context) => ProfileForm(),
        HomeTech.routeName: (context) => HomeTech(),
        Login.routeName: (context) => Login(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        FirstScreen.routeName : (context) => FirstScreen()
      },
    );
  }
}
