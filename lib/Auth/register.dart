import 'package:acadmy/Auth/hive_preference_util.dart';
import 'package:acadmy/Auth/login.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:acadmy/resources_app/color_manager.dart';
import 'package:acadmy/resources_app/font_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String routeName = 'register Screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String firstName = '';
  String lastName = '';
  String userName = '';
  String email = '';
  String password = '';
  String rePassword = '';
  bool isLoading = false;  // متغير للتحكم في حالة التحميل
  var formKey = GlobalKey<FormState>();

  static checkHiveData() async {
    String? name = await HivePreferenceUtil.getName();
    String? email = await HivePreferenceUtil.getEmail();
    print('name : $name');
    print('email : $email');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          'assets/images/backGround.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
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
                      height: MediaQuery.of(context).size.height * 0.15,
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
                    // Enter email
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
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                      ),
                    ),
                    // Enter password
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
                            return 'Please Enter Password';
                          }
                          if (password.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    // Enter rePassword
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Re-enter Password',
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
                          return 'Please Re-enter Password';
                        }
                        if (text != password) {
                          return "Passwords do not match";
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Login.routeName);
                      },
                      child: Text(
                        "Or Sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // عرض حالة التحميل أثناء التسجيل
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void validateForm() async {
    if (formKey.currentState?.validate() == true) {
      setState(() {
        isLoading = true; // تفعيل حالة التحميل
      });

      try {
        // محاولة إنشاء حساب جديد
        final result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String fullName = "$firstName $lastName";
        await result.user?.updateDisplayName(fullName);
        await result.user?.reload();
        HivePreferenceUtil.saveName(value: fullName);
        HivePreferenceUtil.saveEmail(value: result.user?.email ?? '');

        print('firebase auth id : ${result.user?.uid}');
        checkHiveData();

        // عرض Snackbar في حالة النجاح
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("تم إنشاء الحساب بنجاح"),
          backgroundColor: Colors.grey,
        ));

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeTab()),
                (Route<dynamic> route) => false);

      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false; // إيقاف التحميل في حالة حدوث خطأ
        });

        // التعامل مع الأخطاء
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("كلمة المرور ضعيفة!"),
            backgroundColor: Colors.red,
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("البريد الإلكتروني مسجل بالفعل!"),
            backgroundColor: Colors.red,
          ));
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("حدث خطأ يرجى المحاولة لاحقًا"),
          backgroundColor: Colors.red,
        ));
        print(e);
      }
    }
  }
}
