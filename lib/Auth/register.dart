import 'package:acadmy/resources_app/font_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = 'register Screen';
  String firstName = '';
  String lastName = '';
  String userName = '';
  String email = '';
  String password = '';
  String rePassword = '';
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
            backgroundColor: Colors.transparent,
            title: Text(
              'Create Account',
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
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    // Enter First name
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.lightGreen, width: 3),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))),
                      onChanged: (text) {
                        firstName = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter First Name';
                        }
                        return null;
                      },
                    ),
                    // Enter last name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Last Name',
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
                          lastName = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Last Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    // Enter user name
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'User Name',
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
                          userName = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter User Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    // enter email
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
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
                              borderSide:
                                  BorderSide(color: Colors.lightGreen, width: 3),
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'rePassword',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.lightGreen, width: 3),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                      ),
                      onChanged: (text) {
                        rePassword = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter First Name';
                        }
                        if (password.length < 6) {
                          return " please must be at least 6 chars";
                        }
                        if (text != password){
                          return"rePassword do not match";
                        }
                        return null;
                      },
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
                                "Create Account",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSize.s16,
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
    if (formKey.currentState?.validate() == true){
      // register
      try {
        final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('firebase auth id : ${result.user?.uid}');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

  }
}
