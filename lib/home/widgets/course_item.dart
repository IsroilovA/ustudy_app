import 'package:flutter/material.dart';
import 'package:ustudy_app/data/models/course.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(course.imageUrl),
              Align(
                  alignment: Alignment.topRight,
                  child: Icon(course.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline))
            ],
          ),
          Text(course.name)
        ],
      ),
    );
  }
}
