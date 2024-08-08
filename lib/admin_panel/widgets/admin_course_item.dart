import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/admin_panel/cubit/admin_panel_cubit.dart';
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
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(Icons.edit),
              title: const Text("Изменить"),
            )),
            PopupMenuItem(
                child: ListTile(
              onTap: () {
                BlocProvider.of<AdminPanelCubit>(context).deleteCourse(course);
                Navigator.of(context).pop();
              },
              leading: const Icon(Icons.delete),
              title: const Text("Удалить"),
            )),
          ];
        },
      ),
    );
  }
}
