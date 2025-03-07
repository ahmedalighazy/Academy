import 'package:acadmy/Auth/login.dart';
import 'package:acadmy/Auth/register.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const String routeName = "FirstScreen";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset("assets/images/backGround.png",
        width: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xdff2872A4)
                          ),
                            onPressed: () {
                           Navigator.of(context).pushNamed(RegisterScreen.routeName);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.school_outlined,size: 35,color: Colors.white,),
                                Text("معلم",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ))),
                  ),
                  Container(

                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff3598DB)
                        ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(RegisterScreen.routeName);

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.group_sharp,size: 35,color: Colors.white,),
                              Text(
                                "طالب",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
