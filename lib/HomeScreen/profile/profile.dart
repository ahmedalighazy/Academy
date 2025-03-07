import 'package:acadmy/Auth/login.dart';
import 'package:flutter/material.dart';

import '../../Auth/hive_preference_util.dart';

class ProfileForm extends StatefulWidget {
  static const String routeName = "profileForm";

  const ProfileForm({super.key});

  @override
  Profile createState() => Profile();
}

class Profile extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String major = '';
  String year = '';
  String activities = '';
  String email = '';

  @override
  void initState() {
    loadUserData();
  }

  void loadUserData() async {
    String? userEmail = await HivePreferenceUtil.getEmail();
    String? userName = await HivePreferenceUtil.getName();
    setState(() {
      email = userEmail ?? '';
      name = userName ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // اللون الخلفي للصفحة
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
            child: Icon(Icons.logout),
          ),
        ],
        title: const Text(
          'Your Profile',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff3598DB),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // نموذج إدخال البيانات
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم الطالب
                    TextFormField(
                      controller: TextEditingController(text: name),
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xff3598DB)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    // الايميل
                    TextFormField(
                      controller: TextEditingController(text: email),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefixIcon: Icon(Icons.email, color: Color(0xff3598DB)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    // التخصص الجامعي
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Major',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefixIcon:
                            Icon(Icons.school, color: Color(0xff3598DB)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          major = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your major';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    // السنة الدراسية
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Year of Study',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefixIcon: Icon(Icons.calendar_today,
                            color: Color(0xff3598DB)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          year = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your year of study';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 50),
                    // زر حفظ البيانات
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Profile Saved')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff3598DB),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Save Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
