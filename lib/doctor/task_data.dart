import 'package:hive/hive.dart';

part 'task_data.g.dart'; // تأكد من أنك قد نفذت الأمر لإنشاء ملف g.dart باستخدام: flutter packages pub run build_runner build

@HiveType(typeId: 0)
class TaskData extends HiveObject {
  @HiveField(0)
  String? doctorName;

  @HiveField(1)
  String? courseName;

  @HiveField(2)
  String? grade;

  @HiveField(3)
  String? task;

  @HiveField(4)
  String? deadline;

  @HiveField(5)
  String? file; // حقل لتخزين المسار الخاص بالملف

  TaskData({
    this.doctorName,
    this.courseName,
    this.grade,
    this.task,
    this.deadline,
    this.file, // إضافة الملف كاختياري
  });

  // تحويل الكائن إلى خريطة (Map) لتخزينه في Hive
  Map<String, String?> toMap() {
    return {
      'doctor': doctorName,
      'course': courseName,
      'level': grade,
      'file': task, // هنا هو اسم الحقل الذي يخص المهمة/الملف
      'deadline': deadline,
      'file_path': file, // إضافة المسار الخاص بالملف
    };
  }

  // إنشاء الكائن من خريطة (Map) عند استرجاعه من Hive
  factory TaskData.fromMap(Map<String, dynamic> map) {
    return TaskData(
      doctorName: map['doctor'] ?? '',
      courseName: map['course'] ?? '',
      grade: map['level'] ?? '',
      task: map['file'] ?? '',
      deadline: map['deadline'] ?? '',
      file: map['file_path'], // استرجاع المسار من الخريطة
    );
  }
}
