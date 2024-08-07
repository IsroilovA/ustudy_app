import 'package:flutter/material.dart';
import 'package:ustudy_app/course_details/course_details_screen.dart';
import 'package:ustudy_app/data/models/course.dart';

class CourseItem extends StatefulWidget {
  const CourseItem({super.key, required this.course});

  final Course course;

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  late bool _isSelected;

  @override
  void initState() {
    _isSelected = widget.course.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CourseDetailsScreen(course: widget.course),
        ));
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.course.imageUrl,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              //adding to favorites logic
                              setState(() {
                                _isSelected = !_isSelected;
                              });
                            },
                            color: Colors.red,
                            isSelected: _isSelected,
                            selectedIcon: const Icon(Icons.favorite),
                            icon: const Icon(Icons.favorite_outline_outlined),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text(widget.course.name),
            )
          ],
        ),
      ),
    );
  }
}
