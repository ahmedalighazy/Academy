import 'package:acadmy/HomeScreen/Home_tech/HomeTech.dart';
import 'package:acadmy/doctor/task_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Auth/first_screen.dart';
import '../resources_app/color_manager.dart';

class AddTaskDoctor extends StatefulWidget {
  const AddTaskDoctor({super.key});

  static const String routeName = 'Add Task Doctor';

  @override
  State<AddTaskDoctor> createState() => _AddTaskDoctorState();
}

class _AddTaskDoctorState extends State<AddTaskDoctor> {
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff2872A4), // لون الخلفية
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        deadlineController.text = "${picked.toLocal()}".split(' ')[0]; // تنسيق التاريخ
      });
    }
  }

  void saveTask() async {
    if (doctorNameController.text.isEmpty ||
        courseController.text.isEmpty ||
        gradeController.text.isEmpty ||
        taskController.text.isEmpty ||
        deadlineController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "يرجى ملء جميع الحقول",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      var box = Hive.box<TaskData>('tasks');
      TaskData newTask = TaskData(
        doctorName: doctorNameController.text,
        courseName: courseController.text,
        grade: gradeController.text,
        task: taskController.text,
        deadline: deadlineController.text,
      );
      await box.add(newTask);
      doctorNameController.clear();
      courseController.clear();
      gradeController.clear();
      taskController.clear();
      deadlineController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "تم ارسال Task بنجاح",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "فشل في حفظ Task",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        taskController.text = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, FirstScreen.routeName);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.white,
            )),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomeTech.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.task,
                  color: ColorManager.white,
                ),
              ))
        ],
        backgroundColor: Color(0xff2872A4),
        title: Text(
          "Doctor Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
          child: Column(
            children: [
              // اسم الدكتور
              TextField(
                controller: doctorNameController,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  suffixIcon: Icon(
                    Icons.school,
                    color: Colors.blue,
                    size: 35,
                  ),
                  hintText: "اسم الدكتور",
                  hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // المقرر الدراسي
              TextField(
                controller: courseController,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "المقرر الدراسي",
                  hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // الفرقة الدراسية
              TextField(
                controller: gradeController,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "الفرقة الدراسية",
                  hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // المهمة (الواجب الدراسي)
              TextField(
                controller: taskController,
                maxLines: 5, // تحديد عدد الأسطر
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "الواجب الدراسي",
                  hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // موعد التسليم مع زر اختيار التاريخ داخل الحقل
              TextField(
                controller: deadlineController,
                textAlign: TextAlign.end,
                readOnly: true, // يجعل الحقل للقراءة فقط
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "موعد التسليم",
                  hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  suffixIcon: GestureDetector(
                    onTap: () => _selectDate(context), // فتح تقويم اختيار التاريخ
                    child: Icon(
                      Icons.calendar_today,
                      color: Color(0xff2872A4),
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // أزرار الحفظ والتحميل
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: pickFile,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightBlue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.file_present_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: saveTask,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.lightGreen],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.save,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}