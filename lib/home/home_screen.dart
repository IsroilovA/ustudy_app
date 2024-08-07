import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/home/cubit/courses_cubit.dart';
import 'package:ustudy_app/home/widgets/course_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Бесплатные курсы",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              if (state is CoursesInitial) {
                BlocProvider.of<CoursesCubit>(context).loadCourses();
              } else if (state is CoursesLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    return CourseItem(
                      course: state.courses[index],
                    );
                  },
                );
              } else if (state is NoCourses) {
                return const Center(
                  child: Text("Курсы не найдены"),
                );
              } else if (state is CoursesError) {
                return Center(
                  child: Text(state.message!),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ],
      ),
    );
  }
}
