import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:flutter/material.dart';
import 'package:acadmy/resources_app/color_manager.dart';

// تعريف مادة دراسية
class Course {
  final String name;
  final String professor;

  Course({required this.name, required this.professor});
}

// تعريف السنة الدراسية
class AcademicYear {
  final String yearName;
  final List<Course> semester1;
  final List<Course> semester2;

  AcademicYear({
    required this.yearName,
    required this.semester1,
    required this.semester2,
  });
}

class SubjectStu extends StatefulWidget {
  static const String routeName = 'SubjectStu';

  @override
  State<SubjectStu> createState() => _SubjectStuState();
}

class _SubjectStuState extends State<SubjectStu> {
  final List<AcademicYear> academicYears = [
    // الفرقة الأولى
    AcademicYear(
      yearName: 'الفرقة الأولى',
      semester1: [
        Course(name: 'مقدمة في الحوسبة', professor: 'ناهد'),
        Course(name: 'معالجة النصوص', professor: 'شيماء خاطر'),
        Course(name: 'أساليب إحصائية', professor: 'محمد غنيم'),
      ],
      semester2: [
        Course(name: 'رياضيات حاسبات', professor: 'احمد امين'),
        Course(name: 'هياكل بيانات', professor: 'سامي'),
      ],
    ),
    // الفرقة الثانية
    AcademicYear(
      yearName: 'الفرقة الثانية',
      semester1: [
        Course(name: 'جبر خطي', professor: 'عماد محمود'),
        Course(name: 'خوارزميات', professor: 'علي سعيد'),
      ],
      semester2: [
        Course(name: 'تصميم الخوارزميات', professor: 'أحمد يوسف'),
        Course(name: 'برمجة الشبكات', professor: 'أحمد مصطفى'),
      ],
    ),
    // الفرقة الثالثة
    AcademicYear(
      yearName: 'الفرقة الثالثة',
      semester1: [
        Course(name: 'ذكاء اصطناعي', professor: 'د. محمد عبدالله'),
        Course(name: 'أنظمة التشغيل', professor: 'د. كريم'),
      ],
      semester2: [
        Course(name: 'قواعد البيانات', professor: 'د. سامية'),
        Course(name: 'تصميم نظم مدمجة', professor: 'د. صلاح'),
      ],
    ),
    // الفرقة الرابعة
    AcademicYear(
      yearName: 'الفرقة الرابعة',
      semester1: [
        Course(name: 'برمجة تطبيقات الهاتف', professor: 'د. فاطمة'),
        Course(name: 'شبكات الكمبيوتر', professor: 'د. مصطفى'),
      ],
      semester2: [
        Course(name: 'تكنولوجيا المعلومات', professor: 'د. عادل'),
        Course(name: 'الأمن السيبراني', professor: 'د. أحمد'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text(
          'المواد الدراسية',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: academicYears.length,
        itemBuilder: (context, index) {
          final year = academicYears[index];
          return _buildYearCard(context, year);
        },
      ),
    );
  }

  Widget _buildYearCard(BuildContext context, AcademicYear year) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => _navigateToSemesters(context, year),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.primary.withOpacity(0.1),
                ColorManager.lightPrimary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(Icons.school, size: 40, color: ColorManager.primary),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  year.yearName,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.darkBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSemesters(BuildContext context, AcademicYear year) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SemestersScreen(year: year),
      ),
    );
  }
}

class SemestersScreen extends StatelessWidget {
  final AcademicYear year;

  const SemestersScreen({required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primary,
        title: Text(
          year.yearName,
          style: TextStyle(color: ColorManager.white),
        ),
      ),
      body: Column(
        children: [
          _buildSemesterCard(context, 'الفصل الدراسي الأول', year.semester1),
          _buildSemesterCard(context, 'الفصل الدراسي الثاني', year.semester2),
        ],
      ),
    );
  }

  Widget _buildSemesterCard(BuildContext context, String title, List<Course> courses) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.95, end: 1.0),
        duration: Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Card(
          margin: EdgeInsets.all(12),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: ColorManager.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () => _navigateToCourses(context, title, courses),
            borderRadius: BorderRadius.circular(15),
            splashColor: ColorManager.primary.withOpacity(0.1),
            highlightColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorManager.lightPrimary.withOpacity(0.1),
                    ColorManager.primary.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorManager.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.library_books_rounded,
                      color: ColorManager.primary,
                      size: 28,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.darkBlue,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'عدد المواد: ${courses.length}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.double_arrow,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCourses(BuildContext context, String title, List<Course> courses) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupDetailPage(
          groupName: title,
          courses: courses,
        ),
      ),
    );
  }
}

class GroupDetailPage extends StatelessWidget {
  final String groupName;
  final List<Course> courses;

  GroupDetailPage({required this.groupName, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        centerTitle: true,
        title: Text(
          groupName,
          style: TextStyle(
            color: ColorManager.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final course = courses[index];
          return _buildCourseCard(context, course);
        },
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black.withOpacity(0.1),
      child: InkWell(
        onTap: () {
          // يمكنك إضافة أي إجراء هنا إذا كنت ترغب
        },
        borderRadius: BorderRadius.circular(15),
        splashColor: ColorManager.primary.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                ColorManager.lightPrimary.withOpacity(0.15),
                ColorManager.primary.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorManager.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.menu_book,
                  color: ColorManager.primary,
                  size: 30,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      course.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.darkBlue,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'المحاضر: ${course.professor}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble, color: Colors.grey[500]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatStu(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
