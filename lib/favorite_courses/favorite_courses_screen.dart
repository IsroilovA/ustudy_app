import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/all_courses_list/cubit/courses_cubit.dart';
import 'package:ustudy_app/all_courses_list/widgets/course_item.dart';

class FavoriteCoursesScreen extends StatelessWidget {
  const FavoriteCoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      buildWhen: (previous, current) {
        if (current is FavoriteCoursesLoaded) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is FavoriteCoursesLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: CourseItem(course: state.courses[index]));
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
