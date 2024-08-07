import 'package:flutter/material.dart';
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
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return CourseItem();
            },
          ),
        ],
      ),
    );
  }
}
