import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tech/HomeTech.dart';
import 'package:acadmy/doctor/add_task_doctor.dart';
import 'package:acadmy/resources_app/color_manager.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  static const String routeName = "FirstScreen";

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _iconAnimation = Tween<double>(begin: 0.8, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          "assets/images/backGround.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Academy',style: TextStyle(
              color: ColorManager.white,
              fontSize: 30
            ),),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // زر المعلم
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xdff2872A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(AddTaskDoctor.routeName);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // حركة للأيقونة
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _iconAnimation.value,
                                child: Icon(
                                  Icons.school_outlined,
                                  size: 40,  // زيادة حجم الأيقونة قليلاً
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 15),
                          Text(
                            "معلم",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // زر الطالب
                Padding(
                  padding: const EdgeInsets.only(top: 20),  // مسافة بين الأزرار
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3598DB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // حركة للأيقونة
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _iconAnimation.value,
                                child: Icon(
                                  Icons.group_sharp,
                                  size: 40,  // زيادة حجم الأيقونة قليلاً
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 15),
                          Text(
                            "طالب",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
