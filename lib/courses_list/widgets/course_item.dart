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
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  course.imageUrl,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            course.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: Colors.red,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Text(course.name),
          )
        ],
      ),
    );
  }
}
