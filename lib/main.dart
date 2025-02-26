import 'package:acadmy/Auth/login.dart';
import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:acadmy/HomeScreen/Subject/SubjectStu.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:acadmy/HomeScreen/profile/profile.dart';
import 'package:flutter/material.dart';

void  main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeTab.routeName,
      routes: {
        HomeTab.routeName:(context)=>HomeTab(),
        SubjectStu.routeName:(context)=>SubjectStu(),
        ChatStu.routeName:(context)=>ChatStu(),
        Profile.routeName:(context)=>Profile(),
        Login.routName:(context)=>Login(),
        Register.routName:(context)=>Register()
      },
    );
  }
}
