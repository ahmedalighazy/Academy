import 'package:flutter/material.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:acadmy/resources_app/color_manager.dart';

class Course {
  final String name;
  final String professor;

  Course({required this.name, required this.professor});
}

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
    AcademicYear(
      yearName: 'الفرقة الأولى',
      semester1: [
        Course(name: 'مقدمة في البرمجة', professor: 'ناهد'),
        Course(name: 'معالجة النصوص', professor: 'شيماء خاطر'),
        Course(name: 'تكنولوجيا المعلومات', professor: 'أحمد أمين'),
        Course(name: 'نظم قواعد البيانات', professor: 'عطا'),
        Course(name: 'الرياضيات', professor: 'محمد غنيم'),
        Course(name: 'نظم تشغيل', professor: 'داليا لطفي'),
        Course(name: 'طرق تخطيط البرامج', professor: 'داليا لطفي'),
        Course(name: 'التعليم الالكتروني', professor: 'محمد الشربيني'),
        Course(name: 'مدخل للعلوم التربوية', professor: 'أماني غبور'),
      ],
      semester2: [
        Course(name: 'أساليب إحصائية', professor: 'محمد غنيم'),
        Course(name: 'رياضيات حاسبات', professor: 'أحمد أمين'),
        Course(name: 'مقدمة في الشبكات', professor: 'داليا لطفي'),
        Course(name: 'صيانة الحاسب', professor: 'داليا لطفي'),
        Course(name: 'تحليل وتصميم نظم المعلومات', professor: 'مني عصمت'),
        Course(name: 'اللغة العربية', professor: 'إيهاب'),
        Course(name: 'تصميم واجهات التفاعل', professor: 'وسام كمال'),
        Course(name: 'نظم دعم القرار', professor: 'شيماء خاطر'),
        Course(name: 'قضايا مجتمعية', professor: 'مروة الششتاوي'),
      ],
    ),
    AcademicYear(
      yearName: 'الفرقة الثانية',
      semester1: [
        Course(name: 'برمجة موجهة نحو الكائنات', professor: 'د. حسنية'),
        Course(name: 'نظم تشغيل حاسبات ٢', professor: 'إيمان العياط'),
        Course(name: 'الرسم بالحاسب', professor: 'وسام كمال'),
        Course(name: 'هياكل بيانات و خوارزميات', professor: 'عطا'),
        Course(name: 'اللغة الإنجليزية', professor: 'عطا'),
        Course(name: 'تطبيقات الحاسب الآلي', professor: 'أحمد أمين'),
        Course(name: 'تصميم تعليمي', professor: 'محمد الغريب'),
        Course(name: 'علم نفس النمو', professor: 'إيمان الجمل'),
      ],
      semester2: [
        Course(name: 'برمجة تطبيقات ١', professor: 'د. حسنية'),
        Course(name: 'برمجة الشبكات', professor: 'داليا لطفي'),
        Course(name: 'الواقع الافتراضي', professor: 'أحمد أمين'),
        Course(name: 'محركات بحث', professor: 'داليا لطفي'),
        Course(name: 'معمارية الحاسبات', professor: 'شيماء خاطر'),
        Course(name: 'وسائل تعليمية', professor: 'حسن الصباغ'),
        Course(name: 'أدوات وتطبيقات التقويم الإلكتروني', professor: 'محمد الغريب'),
        Course(name: 'التدريس المصغر', professor: 'أسعد'),
        Course(name: 'الأصول الاجتماعية للتربية', professor: 'أماني غبور'),
      ],
    ),
    AcademicYear(
      yearName: 'الفرقة الثالثة',
      semester1: [
        Course(name: 'برمجة متقدمة', professor: 'د. ناهد'),
        Course(name: 'الرسم بالحاسب ٢', professor: 'وسام كمال'),
        Course(name: 'الذكاء الاصطناعي', professor: 'إيمان عبد العظيم'),
        Course(name: 'تحليل بيانات', professor: 'عطا'),
        Course(name: 'وسائط متعددة', professor: 'أحمد أمين'),
        Course(name: 'تعليم عن بعد', professor: 'محمد الشربيني'),
        Course(name: 'مناهج دراسية', professor: 'سعد'),
        Course(name: 'تاريخ التربية والنظم المقارنة', professor: 'إيهاب'),
        Course(name: 'سيكولوجية ذوي الاحتياجات الخاصة', professor: 'مروة الششتاوي'),
      ],
      semester2: [
        Course(name: 'برمجة تطبيقات 2', professor: 'د. حسنية'),
        Course(name: 'تصميم مواقع', professor: 'داليا لطفي'),
        Course(name: 'الرؤية بالحاسب', professor: 'أحمد أمين'),
        Course(name: 'مستودعات بيانات', professor: 'عطا'),
        Course(name: 'أمن البيانات', professor: 'مني عصمت'),
        Course(name: 'طرق التدريس العامة', professor: 'إيمان العياط'),
        Course(name: 'المدخل إلى التخطيط التربوي', professor: 'أماني غبور'),
        Course(name: 'علم النفس التربوي', professor: 'أماني غبور'),
      ],
    ),
    AcademicYear(
      yearName: 'الفرقة الرابعة',
      semester1: [
        Course(name: 'برمجة تطبيقات المحمول', professor: 'د. وسام كمال'),
        Course(name: 'تطبيقات الحاسب الآلي', professor: 'د. أحمد أمين'),
        Course(name: 'هندسة البرمجيات', professor: 'د. داليا لطفي'),
        Course(name: 'النظم القائمة على المعرفة', professor: 'د. منى عصمت'),
        Course(name: 'تصميم وإنتاج برمجيات', professor: 'د. حسن الصباغ'),
        Course(name: 'المدخل إلى الإدارة التربوية', professor: 'د. أماني غبور'),
        Course(name: 'الفروق الفردية', professor: 'د. أمينة شلبي'),
        Course(name: 'طرق التدريس التخصصية', professor: 'د. إيهاب'),
      ],
      semester2: [
        Course(name: 'تطوير مناهج', professor: 'د. سوزان عبد الملاك'),
        Course(name: 'الأصول الفلسفية', professor: 'د. أماني غبور'),
        Course(name: 'التنقيب في البيانات', professor: 'محمد السيد غليم'),
        Course(name: 'معالجة اللغات الطبيعية', professor: 'د. ناهد على عماشه'),
        Course(name: 'اختبار وضمان جودة البرمجيات', professor: 'محمد السيد غليم'),
        Course(name: 'اتجاهات حديثة في علوم الحاسب', professor: 'د. منى عصمت'),
        Course(name: 'الصحة النفسية', professor: 'د. مروة إبراهيم الششتاوي'),
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
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: ColorManager.white)),
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
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: ColorManager.white)),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseExamPage(course: course),
            ),
          );
        },
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseExamPage(course: course),
                    ),
                  );
                },
                child: Container(
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatStu(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.chat_outlined,
                          color: ColorManager.primary,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class CourseExamPage extends StatefulWidget {
  final Course course;

  const CourseExamPage({required this.course});

  @override
  _CourseExamPageState createState() => _CourseExamPageState();
}

class _CourseExamPageState extends State<CourseExamPage> {
  late List<Question> questions;
  List<int?> selectedAnswers = [];
  bool examSubmitted = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    questions = _generateQuestionsForCourse(widget.course.name);
    selectedAnswers = List.filled(questions.length, null);
  }

  List<Question> _generateQuestionsForCourse(String courseName) {
    switch (courseName) {
      case 'مقدمة في البرمجة':
        return [
          Question(
            text: 'ما هي أول لغة برمجة عالية المستوى؟',
            options: ['كوبول', 'فورتران', 'أسمبلي', 'بايثون'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي بنية البيانات التي تستخدم مبدأ LIFO؟',
            options: ['الطابور', 'المكدس', 'القائمة', 'الشجرة'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو نوع اللغة التي تحتاج إلى مترجم (Compiler)؟',
            options: ['لغة مفسرة', 'لغة مترجمة', 'لغة ترميز', 'لغة استعلام'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي لغة البرمجة المستخدمة لإنشاء تطبيقات iOS؟',
            options: ['جافا', 'سويفت', 'كوتلن', 'سي شارب'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي أداة تستخدم لتتبع الأخطاء في البرمجة؟',
            options: ['المترجم', 'المصحح', 'المفسر', 'المحرر'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو البرنامج الذي يحول الكود المصدري إلى كود آلة؟',
            options: ['المترجم', 'المفسر', 'المحرر', 'المصحح'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي لغة البرمجة التي طورتها مايكروسوفت؟',
            options: ['Java', 'C#', 'Python', 'Ruby'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي دالة البدء في لغة C++؟',
            options: ['start()', 'begin()', 'main()', 'init()'],
            correctAnswerIndex: 2,
          ),
          Question(
            text: 'ما هي لغة البرمجة التي تستخدم لاستعلام قواعد البيانات؟',
            options: ['SQL', 'HTML', 'CSS', 'JavaScript'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي أداة التحكم في الإصدارات الأكثر شيوعًا؟',
            options: ['SVN', 'Git', 'Mercurial', 'CVS'],
            correctAnswerIndex: 1,
          ),
        ];

      case 'معالجة النصوص':
        return [
          Question(
            text: 'ما هو البرنامج الأكثر استخدامًا لمعالجة النصوص؟',
            options: ['Microsoft Word', 'Excel', 'Photoshop', 'Visual Studio'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هو اختصار حفظ المستند في معظم برامج معالجة النصوص؟',
            options: ['Ctrl+S', 'Ctrl+C', 'Ctrl+V', 'Ctrl+X'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي وظيفة مفتاح F7 في برامج معالجة النصوص؟',
            options: ['فحص إملائي', 'حفظ المستند', 'طباعة المستند', 'إغلاق البرنامج'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي المسافة القياسية بين الأسطر في المستندات الرسمية؟',
            options: ['1.0', '1.5', '2.0', '2.5'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو حجم الخط القياسي للمستندات الرسمية؟',
            options: ['10', '12', '14', '16'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي وظيفة زر Ctrl+B في معالجة النصوص؟',
            options: ['تغميق النص', 'توسيط النص', 'نسخ النص', 'حفظ المستند'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هو امتداد ملف Microsoft Word الافتراضي؟',
            options: ['.txt', '.docx', '.pdf', '.xlsx'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي الميزة التي تتيح لك رؤية كيف سيبدو المستند عند الطباعة؟',
            options: ['معاينة قبل الطباعة', 'عرض تخطيط الصفحة', 'عرض القراءة', 'عرض الويب'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هو اختصار التراجع عن الإجراء الأخير؟',
            options: ['Ctrl+Z', 'Ctrl+Y', 'Ctrl+X', 'Ctrl+C'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي وظيفة علامة التبويب "مراجع" في Word؟',
            options: ['إضافة الجداول', 'إضافة الفهارس والهوامش', 'تغيير الخط', 'إدراج الصور'],
            correctAnswerIndex: 1,
          ),
        ];

      case 'تكنولوجيا المعلومات':
        return [
          Question(
            text: 'ما هي مكونات الحاسوب الأساسية؟',
            options: ['لوحة المفاتيح والفأرة', 'المعالج والذاكرة', 'الشاشة والسماعات', 'الطابعة والماسح'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي وحدة قياس سرعة المعالج؟',
            options: ['بت', 'بايت', 'هيرتز', 'واط'],
            correctAnswerIndex: 2,
          ),
          Question(
            text: 'ما هي لغة الآلة التي يفهمها الحاسوب؟',
            options: ['النظام الثنائي (0 و1)', 'لغة التجميع', 'لغة الجافا', 'لغة البايثون'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي وظيفة نظام التشغيل؟',
            options: ['إدارة موارد الحاسوب', 'تصفح الإنترنت', 'تحرير النصوص', 'إنشاء العروض'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي أنواع الذاكرة في الحاسوب؟',
            options: ['RAM وROM', 'HDD وSSD', 'USB وCD', 'DVD وBlu-ray'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هو البرنامج المسؤول عن إدارة الملفات في Windows؟',
            options: ['المستكشف', 'المحول', 'المحرر', 'المفسر'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي أسرع أنواع وسائط التخزين؟',
            options: ['HDD', 'SSD', 'USB', 'CD'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي لغة البرمجة المستخدمة لإنشاء صفحات ويب تفاعلية؟',
            options: ['HTML', 'CSS', 'JavaScript', 'Python'],
            correctAnswerIndex: 2,
          ),
          Question(
            text: 'ما هي تقنية الاتصال اللاسلكي قصير المدى؟',
            options: ['Wi-Fi', 'Bluetooth', '4G', 'GPS'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو البروتوكول المستخدم في نقل صفحات الويب؟',
            options: ['HTTP', 'FTP', 'SMTP', 'TCP'],
            correctAnswerIndex: 0,
          ),
        ];

      case 'نظم قواعد البيانات':
        return [
          Question(
            text: 'ما هو نظام إدارة قواعد البيانات العلائقية الأكثر شهرة؟',
            options: ['MySQL', 'MongoDB', 'Oracle', 'SQL Server'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي لغة الاستعلام المستخدمة في قواعد البيانات العلائقية؟',
            options: ['SQL', 'NoSQL', 'Java', 'Python'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي العملية التي تضمن عدم تكرار البيانات في قاعدة البيانات؟',
            options: ['التطبيع', 'التكرار', 'الدمج', 'التقسيم'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هو العنصر الأساسي في قاعدة البيانات الذي يحتوي على البيانات؟',
            options: ['الجداول', 'الاستعلامات', 'النماذج', 'التقارير'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي الخاصية التي تضمن أن كل سجل في الجدول فريد؟',
            options: ['المفتاح الأساسي', 'المفتاح الخارجي', 'القيد', 'الفهرس'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي وظيفة المفتاح الخارجي في قاعدة البيانات؟',
            options: ['إنشاء علاقة بين الجداول', 'حذف البيانات', 'تعديل الهيكل', 'إنشاء نسخة احتياطية'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هو نوع قاعدة البيانات الذي لا يستخدم الجداول؟',
            options: ['العلائقية', 'الكائنية', 'الوثائقية', 'الشبكية'],
            correctAnswerIndex: 2,
          ),
          Question(
            text: 'ما هي الأوامر الرئيسية في لغة SQL؟',
            options: ['SELECT, INSERT, UPDATE, DELETE', 'READ, WRITE, EDIT, REMOVE', 'GET, POST, PUT, PATCH', 'OPEN, CLOSE, SAVE, EXIT'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي وظيفة الأمر SELECT في SQL؟',
            options: ['إدراج بيانات', 'استرجاع بيانات', 'تحديث بيانات', 'حذف بيانات'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هي الخاصية التي تضمن تنفيذ جميع الأوامر أو لا ينفذ أي منها؟',
            options: ['المعاملة', 'الانتقال', 'الالتزام', 'التراجع'],
            correctAnswerIndex: 2,
          ),
        ];

    // يمكنك إضافة المزيد من المواد هنا بنفس الطريقة
      default:
        return [
          Question(
            text: 'ما هي عاصمة مصر؟',
            options: ['القاهرة', 'الإسكندرية', 'الجيزة', 'أسوان'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'كم عدد أيام الأسبوع؟',
            options: ['5', '6', '7', '8'],
            correctAnswerIndex: 2,
          ),
          Question(
            text: 'ما هو لون التفاحة الناضجة؟',
            options: ['أزرق', 'أحمر', 'أصفر', 'أخضر'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو أكبر كوكب في المجموعة الشمسية؟',
            options: ['الأرض', 'المشتري', 'المريخ', 'زحل'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'من هو مخترع المصباح الكهربائي؟',
            options: ['توماس إديسون', 'ألبرت أينشتاين', 'نيوتن', 'جاليليو'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'ما هي اللغة الرسمية في البرازيل؟',
            options: ['الإسبانية', 'الإنجليزية', 'البرتغالية', 'الفرنسية'],
            correctAnswerIndex: 2,
          ),
          Question(
            text: 'كم عدد حروف اللغة العربية؟',
            options: ['26', '28', '30', '32'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو أطول نهر في العالم؟',
            options: ['النيل', 'الأمازون', 'الميسيسيبي', 'الدانوب'],
            correctAnswerIndex: 0,
          ),
          Question(
            text: 'في أي عام هبط الإنسان على القمر؟',
            options: ['1965', '1969', '1972', '1975'],
            correctAnswerIndex: 1,
          ),
          Question(
            text: 'ما هو رمز عنصر الذهب في الجدول الدوري؟',
            options: ['Ag', 'Au', 'Gd', 'Go'],
            correctAnswerIndex: 1,
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,color: ColorManager.white,),),
        title: Text('اختبار مادة ${widget.course.name}',style: TextStyle(
          fontSize: 25,
          color: ColorManager.white
        ),),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'اختبار ${widget.course.name}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorManager.darkBlue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'أستاذ المادة: ${widget.course.professor}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            ...questions.map((question) => _buildQuestionCard(question)).toList(),
            SizedBox(height: 20),
            if (examSubmitted) _buildResultCard(),
            SizedBox(height: 20),
            Center(
              child:
              ElevatedButton(
                onPressed: examSubmitted
                    ? null
                    : () {
                  int correctAnswers = 0;
                  for (int i = 0; i < questions.length; i++) {
                    if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
                      correctAnswers++;
                    }
                  }
                  setState(() {
                    score = (correctAnswers / questions.length * 100).round();
                    examSubmitted = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  examSubmitted ? 'تم الإرسال' : 'تسليم الإجابات',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    final int questionIndex = questions.indexOf(question);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            ColorManager.lightPrimary.withOpacity(0.1),
            ColorManager.primary.withOpacity(0.05),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'السؤال ${questionIndex + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  question.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.darkBlue,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 20),
                ...question.options.map((option) {
                  final int optionIndex = question.options.indexOf(option);
                  return _buildOptionItem(
                    questionIndex,
                    optionIndex,
                    option,
                    question.correctAnswerIndex,
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildOptionItem(
      int questionIndex,
      int optionIndex,
      String option,
      int correctAnswerIndex,
      ) {
    final bool isSelected = selectedAnswers[questionIndex] == optionIndex;
    final bool isCorrect = optionIndex == correctAnswerIndex;
    final bool showResults = examSubmitted;

    Color borderColor = Colors.grey[300]!;
    Color bgColor = Colors.transparent;
    Color textColor = ColorManager.darkBlue;

    if (showResults) {
      if (isCorrect) {
        bgColor = Colors.green.withOpacity(0.15);
        borderColor = Colors.green;
      } else if (isSelected && !isCorrect) {
        bgColor = Colors.red.withOpacity(0.15);
        borderColor = Colors.red;
      }
    } else if (isSelected) {
      borderColor = ColorManager.primary;
      bgColor = ColorManager.primary.withOpacity(0.1);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: examSubmitted ? null : () {
              setState(() {
                selectedAnswers[questionIndex] = optionIndex;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: borderColor,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? ColorManager.primary : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (showResults && isCorrect)
                    Icon(Icons.check_circle, color: Colors.green),
                  if (showResults && isSelected && !isCorrect)
                    Icon(Icons.cancel, color: Colors.red),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildResultCard() {
    final bool passed = score >= 60;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: passed
              ? [Colors.green.shade100, Colors.green.shade50]
              : [Colors.red.shade100, Colors.red.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Icon(
            passed ? Icons.celebration : Icons.sentiment_dissatisfied,
            size: 60,
            color: passed ? Colors.green : Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            passed ? 'مبروك! لقد نجحت' : 'للأسف لم تنجح',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: passed ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'النسبة: $score%',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: passed ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: 20),
          Text(
            passed
                ? 'تميزت في الإجابات، استمر في التقدم!'
                : 'لا تقلق، يمكنك إعادة المحاولة لاحقًا',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }}