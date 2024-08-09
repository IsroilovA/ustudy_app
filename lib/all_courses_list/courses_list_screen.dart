import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/all_courses_list/cubit/courses_cubit.dart';
import 'package:ustudy_app/all_courses_list/widgets/course_item.dart';

class CoursesListScreen extends StatefulWidget {
  const CoursesListScreen({super.key});

  @override
  State<CoursesListScreen> createState() => _CoursesListScreenState();
}

class _CoursesListScreenState extends State<CoursesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            "Бесплатные курсы",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              if (state is CoursesInitial) {
                BlocProvider.of<CoursesCubit>(context).loadCourses();
              } else if (state is CoursesLoaded) {
                return GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: state.courses.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    crossAxisCount: 2,
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
      );
    // Scaffold(
    //   appBar: AppBar(
    //     elevation: 1,
    //     title: const Text("Курсы"),
    //     centerTitle: false,
    //     actions: [
    //       if (context.select((CoursesCubit cubit) => cubit.state.isAdmin))
    //         IconButton(
    //             onPressed: () async {
    //               await Navigator.of(context).push(MaterialPageRoute(
    //                 builder: (context) => BlocProvider(
    //                   create: (context) => AdminPanelCubit(
    //                     ustudyRepository: locator<UstudyRepository>(),
    //                   ),
    //                   child: const AdminPanelScreen(),
    //                 ),
    //               ));
    //               if (context.mounted) {
    //                 BlocProvider.of<CoursesCubit>(context).loadCourses();
    //               }
    //             },
    //             icon: const Icon(Icons.admin_panel_settings))
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       Text(
    //         "Бесплатные курсы",
    //         style: Theme.of(context).textTheme.headlineSmall,
    //       ),
    //       BlocBuilder<CoursesCubit, CoursesState>(
    //         builder: (context, state) {
    //           if (state is CoursesInitial) {
    //             BlocProvider.of<CoursesCubit>(context).loadCourses();
    //           } else if (state is CoursesLoaded) {
    //             return GridView.builder(
    //               shrinkWrap: true,
    //               padding: const EdgeInsets.all(8),
    //               itemCount: state.courses.length,
    //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                 mainAxisSpacing: 2,
    //                 crossAxisSpacing: 2,
    //                 crossAxisCount: 2,
    //               ),
    //               itemBuilder: (context, index) {
    //                 return CourseItem(
    //                   course: state.courses[index],
    //                 );
    //               },
    //             );
    //           } else if (state is NoCourses) {
    //             return const Center(
    //               child: Text("Курсы не найдены"),
    //             );
    //           } else if (state is CoursesError) {
    //             return Center(
    //               child: Text(state.message!),
    //             );
    //           }
    //           return const Center(
    //             child: CircularProgressIndicator.adaptive(),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
