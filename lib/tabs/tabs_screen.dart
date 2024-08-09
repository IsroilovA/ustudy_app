import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/admin_panel/admin_panel_screen.dart';
import 'package:ustudy_app/admin_panel/cubit/admin_panel_cubit.dart';
import 'package:ustudy_app/all_courses_list/courses_list_screen.dart';
import 'package:ustudy_app/all_courses_list/cubit/courses_cubit.dart';
import 'package:ustudy_app/favorite_courses/favorite_courses_screen.dart';
import 'package:ustudy_app/services/locator.dart';
import 'package:ustudy_app/services/ustudy_repository.dart';
import 'package:ustudy_app/tabs/cubit/tabs_cubit.dart';

// Main screen that handles navigation between different tabs
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((TabsCubit cubit) => cubit.state);
    String pageTitle = switch (selectedTab) {
      0 => "Все курсы",
      1 => "Избранные",
      _ => throw UnimplementedError(),
    };

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(pageTitle),
        actions: [
          if (context.select((CoursesCubit cubit) => cubit.state.isAdmin))
            IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => AdminPanelCubit(
                        ustudyRepository: locator<UstudyRepository>(),
                      ),
                      child: const AdminPanelScreen(),
                    ),
                  ));
                  if (context.mounted) {
                    BlocProvider.of<CoursesCubit>(context).loadCourses();
                  }
                },
                icon: const Icon(Icons.admin_panel_settings))
        ],
      ),
      body: BlocBuilder<TabsCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: const [
              CoursesListScreen(),
              FavoriteCoursesScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: BlocProvider.of<TabsCubit>(context).selectPage,
        currentIndex: selectedTab,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Курсы",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: "Избранные",
            activeIcon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
