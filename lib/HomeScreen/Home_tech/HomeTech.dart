import 'package:acadmy/doctor/task_data.dart';
import 'package:acadmy/resources_app/color_manager.dart';
import 'package:acadmy/resources_app/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../doctor/add_task_doctor.dart';

class HomeTech extends StatefulWidget {
  static const String routeName = 'HomeTech';

  @override
  State<HomeTech> createState() => _HomeTechState();
}

class _HomeTechState extends State<HomeTech> {

  List<Map<String , String? >> tasks =[];

  void navigateToAddTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskDoctor()),
    );
    // if (result != null) {
    //   setState(() {
    //     tasks.add(result);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tasks',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: ColorManager.white),
        ),
        backgroundColor: ColorManager.primary,
        elevation: 5,
      ),
      body: Container(
        color: ColorManager.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "..قائمة المهام الخاصة بك",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Expanded(
                child:
                ValueListenableBuilder(
                  valueListenable: Hive.box<TaskData>('tasks').listenable(),
                  builder: (context, Box<TaskData>box,_) {
                    if (box.isEmpty) {
                      return Center(
                        child: Text('لا توجد مهمام محفوظة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),),
                      );
                    }
                  return ListView.builder(
                    itemCount: box.length ,
                    itemBuilder: (context, index) {
                      final task = box.getAt(index)!;
                      final taskMap = task.toMap();
                      return GestureDetector(
                        onTap: () {
                          // يمكن إضافة وظيفة الضغط على الـ Card هنا
                        },
                        child: Card(
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  ColorManager.primary.withOpacity(0.8),
                                  ColorManager.lightGrey.withOpacity(0.5),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.primary.withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: 3,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "اسم الدكتور : ${taskMap['doctor'] ?? ''}",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.school,
                                        color: ColorManager.primary,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "المقرر الدراسي:${taskMap['course'] ?? ''}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "الفرقة الدراسية:${taskMap['level'] ?? ''}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text('ميعاد التسليم: ${taskMap['deadline'] ?? ''}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  if(taskMap['file'] != null)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.file_copy,
                                        color: ColorManager.primary,
                                        size: 24,
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        icon: Icon(Icons.download, size: 30),
                                        color: ColorManager.primary,
                                        onPressed: () {
                                          // إضافة منطق لتحميل الملف
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
