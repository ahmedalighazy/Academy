import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:acadmy/doctor/task_data.dart'; // تأكد من استيراد TaskData
import 'package:acadmy/Auth/first_screen.dart'; // تأكد من استيراد FirstScreen
import 'package:acadmy/resources_app/color_manager.dart'; // تأكد من استيراد ColorManager

class HomeTech extends StatefulWidget {
  static const String routeName = 'HomeTech';

  @override
  _HomeTechState createState() => _HomeTechState();
}

class _HomeTechState extends State<HomeTech> {
  @override
  void initState() {
    super.initState();
    _requestPermissions(); // طلب الصلاحيات عند بدء التطبيق
  }

  // دالة لطلب صلاحيات التخزين
  Future<void> _requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (status.isGranted) {
        print("صلاحية التخزين تم منحها.");
      } else {
        print("صلاحية التخزين غير منحها.");
        // إظهار رسالة للمستخدم
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("يجب منح صلاحية التخزين لفتح الملفات."),
            action: SnackBarAction(
              label: "فتح الإعدادات",
              onPressed: () async {
                await openAppSettings(); // فتح إعدادات التطبيق
              },
            ),
          ),
        );
      }
    }
  }

  // دالة لفتح الملف
  Future<void> _openFile(String filePath) async {
    var permissionStatus = await Permission.storage.status;
    if (permissionStatus.isGranted) {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        print("Unable to open file: $filePath");
      }
    } else {
      print("Permission to access storage is denied.");
    }
  }

  // دالة لحذف المهمة
  void _deleteTask(int index) async {
    var box = Hive.box<TaskData>('tasks');
    await box.deleteAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حذف المهمة بنجاح!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, FirstScreen.routeName);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: ColorManager.white,
          ),
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
                  borderRadius: BorderRadius.circular(20),
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
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<TaskData>('tasks').listenable(),
                  builder: (context, Box<TaskData> box, _) {
                    if (box.isEmpty) {
                      return Center(
                        child: Text(
                          'لا توجد مهمام محفوظة',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final task = box.getAt(index)!;
                        final taskMap = task.toMap();
                        return GestureDetector(
                          onTap: () {
                            // عند الضغط على الـ Card، نفتح الملف
                            if (taskMap['file'] != null) {
                              _openFile(taskMap['file']!);
                            }
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
                                        Text(
                                          'ميعاد التسليم: ${taskMap['deadline'] ?? ''}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: ColorManager.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    if (taskMap['file'] != null)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.download, size: 30),
                                            color: ColorManager.primary,
                                            onPressed: () async {
                                              // التأكد من المسار
                                              String filePath = taskMap['file']!;
                                              // استخدام مكتبة OpenFile لفتح الملف
                                              await _openFile(filePath);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete, color: Colors.red, size: 30),
                                            onPressed: () {
                                              _deleteTask(index);
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}