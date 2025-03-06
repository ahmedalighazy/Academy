import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';

  String password = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back,
                color: Colors.white,),
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Text(
                      "Welcome Back ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    // enter email
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Colors.lightGreen, width: 3),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2))),
                        onChanged: (text) {
                          email = text;
                        },
                        validator: (text) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text!);
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Email';
                          }
                          if (!emailValid) {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                      ),
                    ),
                    // enter password
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Colors.lightGreen, width: 3),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2))),
                        onChanged: (text) {
                          password = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter First Name';
                          }
                          if (password.length < 6) {
                            return " please must be at least 6 chars";
                          }
                          return null;
                        },
                      ),
                    ),
                     Text("Forgot password?",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: GestureDetector(
                        onTap: () {
                          validateForm();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                     SizedBox(
                       height:20,
                     ),
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).pushNamed(RegisterScreen.routeName);
                       },
                       child: Text("Or Create My Account",
                       textAlign: TextAlign.right,
                       style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w200,
                       ),),
                     )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void validateForm()async {
    if(formKey.currentState?.validate() == true){
      try {
        final resulte = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        print ("login successfully");
        print (resulte.user?.uid);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeTab())
            , (Route<dynamic> route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
