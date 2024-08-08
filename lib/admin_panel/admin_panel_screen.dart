import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/admin_panel/cubit/admin_panel_cubit.dart';
import 'package:ustudy_app/admin_panel/widgets/admin_course_item.dart';
import 'package:ustudy_app/admin_panel/widgets/new_course.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin panel"),
      ),
      body: BlocBuilder<AdminPanelCubit, AdminPanelState>(
        builder: (context, state) {
          if (state is AdminPanelInitial) {
            BlocProvider.of<AdminPanelCubit>(context).loadCourses();
          } else if (state is AdminPanelCoursesLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.courses.length + 1,
              itemBuilder: (context, index) {
                if (index == state.courses.length) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context)
                            .showBottomSheet((ctx) => const NewCourse());
                      },
                      icon: const Icon(Icons.add));
                }
                return AdminCourseItem(course: state.courses[index]);
              },
            );
          } else if (state is AdminPanelNoCourses) {
            return const Center(
              child: Text("Нет курсов"),
            );
          } else if (state is AdminPanelError) {
            return Center(
              child: Text(state.message!),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
