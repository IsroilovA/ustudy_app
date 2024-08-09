import 'package:flutter/material.dart';
import 'package:ustudy_app/course_details/widgets/course_section_widget.dart';
import 'package:ustudy_app/data/models/course.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: course.courseSections!.length,
        itemBuilder: (context, index) {
          return CourseSectionWidget(
            courseSection: course.courseSections![index],
          );
        },
      ),
    );
  }
}
