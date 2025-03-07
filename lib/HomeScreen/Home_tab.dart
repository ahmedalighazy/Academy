import 'package:acadmy/HomeScreen/Home_tech/HomeTech.dart';
import 'package:flutter/material.dart';
import 'package:acadmy/HomeScreen/Subject/SubjectStu.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:acadmy/HomeScreen/profile/profile.dart';
import 'package:acadmy/resources_app/color_manager.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeTab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedItem = 0;
  List<Widget> homeSelect = [
    SubjectStu(),
    ChatStu(),
    ProfileForm(),
    HomeTech()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeSelect[selectedItem],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManager.primary, Colors.blueAccent], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedItem,
          onTap: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selectedItem == 0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.subject,
                  size: MediaQuery.of(context).size.width * 0.07,
                  color: selectedItem == 0 ? Colors.blueAccent : Colors.white,
                ),
              ),
              label: 'Subject',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selectedItem == 1 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.chat_outlined,
                  size: MediaQuery.of(context).size.width * 0.07,
                  color: selectedItem == 1 ? Colors.blueAccent : Colors.white,
                ),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selectedItem == 2 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.width * 0.07,
                  color: selectedItem == 2 ? Colors.blueAccent : Colors.white,
                ),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selectedItem == 3 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.task_sharp,
                  size: MediaQuery.of(context).size.width * 0.07,
                  color: selectedItem == 3 ? Colors.blueAccent : Colors.white,
                ),
              ),
              label: 'Task',
            ),
          ],
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          elevation: 0,
        ),
      ),
    );
  }
}
