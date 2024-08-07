import 'package:flutter/material.dart';
import 'package:ustudy_app/data/models/course_section.dart';

class CourseSectionWidget extends StatelessWidget {
  const CourseSectionWidget({super.key, required this.courseSection});

  final CourseSection courseSection;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height / 4,
            width: size.width,
            child: Image.network(
              courseSection.coverImageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Text(
              courseSection.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
