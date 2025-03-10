import 'package:acadmy/HomeScreen/Home_tech/HomeTech.dart';
import 'package:acadmy/doctor/task_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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

  void saveTask() async {
    try {
      var box = Hive.box<TaskData>('tasks');
      TaskData newTask = TaskData(
          doctorName: doctorNameController.text,
          courseName: courseController.text,
          grade: gradeController.text,
          task: taskController.text,
          deadline: deadlineController.text);
      await box.add(newTask);
      doctorNameController.clear();
      courseController.clear();
      gradeController.clear();
      taskController.clear();
      deadlineController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "تم ارسال Task",
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
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomeTech.routeName);
              },
              child: Icon(Icons.arrow_forward_outlined))
        ],
        backgroundColor: Color(0xff2872A4),
        title: Text(
          "Doctor Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// Doctor Name
            TextField(
              controller: doctorNameController,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  suffixIcon: Icon(
                    Icons.school,
                    color: Colors.black,
                    size: 35,
                  ),
                  hintText: "اسم الدكتور",
                  hintStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),

            /// المقرر الدراسي
            TextField(
              controller: courseController,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "المقرر الدراسي",
                  hintStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),

            /// الفرقة الدراسية
            TextField(
              controller: gradeController,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "الفرقة الدراسية",
                  hintStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),

            /// المهمة
            Expanded(
              child: TextField(
                controller: taskController,
                maxLines: null,
                expands: true,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintMaxLines: 4,
                    hintText: "الواجب الدراسي",
                    hintStyle:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),

            //موعد التسليم
            TextField(
              controller: deadlineController,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 10)),
                hintText: "موعد التسليم",
                hintStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: pickFile,
                  child: Icon(
                    Icons.file_present_outlined,
                    size: 35,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: saveTask,
                  child: Icon(
                    Icons.save,
                    size: 35,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
