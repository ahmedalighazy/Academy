import 'package:acadmy/Auth/register.dart';
import 'package:acadmy/HomeScreen/Home_tab.dart';
import 'package:acadmy/resources_app/color_manager.dart';
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
  bool isLoading = false; // متغير للتحكم في حالة التحميل
  var formKey = GlobalKey<FormState>();

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
                            return "Please Enter Valid Email";
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
                            return 'Please Enter Password';
                          }
                          if (password.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
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
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        "Or Create My Account",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    // عرض تحميل أثناء تسجيل الدخول
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
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
        // محاولة تسجيل الدخول
        final result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        // إذا تم تسجيل الدخول بنجاح
        print("Login successfully");
        print(result.user?.uid);

        // عرض Snackbar في حالة النجاح
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("تم التسجيل بنجاح"),
          backgroundColor: Colors.grey,
        ));

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeTab()),
                (Route<dynamic> route) => false);

        setState(() {
          isLoading = false; // إيقاف التحميل
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false; // إيقاف التحميل في حالة حدوث خطأ
        });

        if (e.code == 'user-not-found') {
          // عرض رسالة خطأ في حالة عدم وجود المستخدم
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("البريد الإلكتروني غير موجود!"),
            backgroundColor: Colors.red,
          ));
        } else if (e.code == 'wrong-password') {
          // عرض رسالة خطأ في حالة كلمة المرور غير صحيحة
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("كلمة المرور غير صحيحة"),
            backgroundColor: Colors.red,
          ));
        }
      }
    }
  }
}
