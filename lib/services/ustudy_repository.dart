import 'dart:convert';

// import 'package:http/http.dart' as http;
import 'package:ustudy_app/data/models/course.dart';

final String mockCoursesJson = jsonEncode([
  {
    "id": "course-123",
    "name": "Introduction to Flutter",
    "description": "A comprehensive course on Flutter development.",
    "isFavorite": true,
    "imageUrl": "https://example.com/course-123-image.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-123",
        "name": "Getting Started",
        "coverImageUrl": "https://example.com/section-1-image.jpg"
      },
      {
        "id": "section-2",
        "courseId": "course-123",
        "name": "Widgets 101",
        "coverImageUrl": "https://example.com/section-2-image.jpg"
      }
    ]
  },
  {
    "id": "course-456",
    "name": "Advanced Dart Programming",
    "description": "Master advanced features of Dart programming language.",
    "isFavorite": false,
    "imageUrl": "https://example.com/course-456-image.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-456",
        "name": "Advanced Syntax",
        "coverImageUrl": "https://example.com/section-1-image.jpg"
      },
      {
        "id": "section-2",
        "courseId": "course-456",
        "name": "Concurrency in Dart",
        "coverImageUrl": "https://example.com/section-2-image.jpg"
      }
    ]
  },
  {
    "id": "course-789",
    "name": "Effective Kotlin",
    "description": "Write idiomatic and performant Kotlin code.",
    "isFavorite": true,
    "imageUrl": "https://example.com/course-789-image.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-789",
        "name": "Kotlin Basics",
        "coverImageUrl": "https://example.com/section-1-image.jpg"
      },
      {
        "id": "section-2",
        "courseId": "course-789",
        "name": "Advanced Kotlin",
        "coverImageUrl": "https://example.com/section-2-image.jpg"
      }
    ]
  },
  {
    "id": "course-101",
    "name": "Java for Beginners",
    "description": "Learn Java from scratch.",
    "isFavorite": false,
    "imageUrl": "https://example.com/course-101-image.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-101",
        "name": "Introduction to Java",
        "coverImageUrl": "https://example.com/section-1-image.jpg"
      },
      {
        "id": "section-2",
        "courseId": "course-101",
        "name": "Object-Oriented Programming",
        "coverImageUrl": "https://example.com/section-2-image.jpg"
      }
    ]
  },
  {
    "id": "course-202",
    "name": "Python for Data Science",
    "description": "Analyze and visualize data using Python.",
    "isFavorite": true,
    "imageUrl": "https://example.com/course-202-image.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-202",
        "name": "Data Analysis",
        "coverImageUrl": "https://example.com/section-1-image.jpg"
      },
      {
        "id": "section-2",
        "courseId": "course-202",
        "name": "Data Visualization",
        "coverImageUrl": "https://example.com/section-2-image.jpg"
      }
    ]
  }
]);

class UstudyRepository {
  UstudyRepository();
  // final _client = http.Client();

  Future<List<Course>> getCourses() async {
    //get cpurses logic
    final json = jsonDecode(mockCoursesJson) as List<dynamic>;
    final posts = json.map(
      (e) => Course.fromJson(
        Map<String, dynamic>.from(e as Map<String, dynamic>),
      ),
    );
    return posts.toList();
  }
}
