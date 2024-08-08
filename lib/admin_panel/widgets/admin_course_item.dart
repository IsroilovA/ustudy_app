import 'package:flutter/material.dart';
import 'package:ustudy_app/data/models/course.dart';

class AdminCourseItem extends StatelessWidget {
  const AdminCourseItem({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(course.imageUrl),
      title: Text(course.name),
      subtitle: Text(course.description),
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
                child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.edit),
              title: const Text("Изменить"),
            )),
            PopupMenuItem(
                child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.delete),
              title: const Text("Удалить"),
            )),
          ];
        },
      ),
    );
  }
}
