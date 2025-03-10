import 'package:hive/hive.dart';
part 'task_data.g.dart';
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

  TaskData(
      {this.doctorName,
        this.courseName,
        this.grade,
        this.task,
        this.deadline});
  Map<String ,String?>toMap(){
    return {
      'doctor' : doctorName,
      'course' : courseName,
      'level' : grade,
      'file' : task,
      'deadline' : deadline
    };

  }

}