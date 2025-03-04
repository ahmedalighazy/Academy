import 'package:acadmy/HomeScreen/Subject/SubjectStu.dart';
import 'package:acadmy/HomeScreen/chat/chat_stu.dart';
import 'package:flutter/material.dart';
import 'package:acadmy/resources_app/color_manager.dart';

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
        separatorBuilder: (context, index) => SizedBox(height: 16), // Add space between items
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
      shadowColor: Colors.black.withOpacity(0.1), // Adding shadow
      child: InkWell(
        onTap: () {
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
