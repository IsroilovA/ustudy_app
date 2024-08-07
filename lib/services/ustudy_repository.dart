import 'dart:convert';

// import 'package:http/http.dart' as http;
import 'package:ustudy_app/data/models/course.dart';

final String mockCoursesJson = jsonEncode([
  {
    "id": "course-123",
    "name": "Introduction to Flutter",
    "description": "A comprehensive course on Flutter development.",
    "isFavorite": true,
    "imageUrl":
        "https://api.reliasoftware.com/uploads/what_is_flutter_fcb6c7a4b8.png",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-123",
        "name": "Getting Started",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/1.png"
      },
      {
        "id": "section-2",
        "courseId": "course-123",
        "name": "Widgets 101",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/2.png"
      }
    ]
  },
  {
    "id": "course-456",
    "name": "Advanced Dart Programming",
    "description": "Master advanced features of Dart programming language.",
    "isFavorite": false,
    "imageUrl":
        "https://mixable.blog/wp-content/uploads/2021/03/dart-logo-scaled.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-456",
        "name": "Advanced Syntax",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/1.png"
      },
      {
        "id": "section-2",
        "courseId": "course-456",
        "name": "Concurrency in Dart",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/2.png"
      }
    ]
  },
  {
    "id": "course-789",
    "name": "Effective Kotlin",
    "description": "Write idiomatic and performant Kotlin code.",
    "isFavorite": true,
    "imageUrl":
        "https://habrastorage.org/getpro/habr/upload_files/784/040/572/784040572c499a4b59cbf7ce8d06e31e.png",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-789",
        "name": "Kotlin Basics",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/1.png"
      },
      {
        "id": "section-2",
        "courseId": "course-789",
        "name": "Advanced Kotlin",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/2.png"
      }
    ]
  },
  {
    "id": "course-101",
    "name": "Java for Beginners",
    "description": "Learn Java from scratch.",
    "isFavorite": false,
    "imageUrl":
        "https://worksolutions.ru/uploads/0ii_Nxk_B8_Myp_Bc_V1_X_Ojvke_UXKZ_Qvzy_NL_No9a8_Flk9_494bc16c17.jpeg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-101",
        "name": "Introduction to Java",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/1.png"
      },
      {
        "id": "section-2",
        "courseId": "course-101",
        "name": "Object-Oriented Programming",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/2.png"
      }
    ]
  },
  {
    "id": "course-202",
    "name": "Python for Data Science",
    "description": "Analyze and visualize data using Python.",
    "isFavorite": true,
    "imageUrl":
        "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230318230239/Python-Data-Science-Tutorial.jpg",
    "courseSections": [
      {
        "id": "section-1",
        "courseId": "course-202",
        "name": "Data Analysis",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/1.png"
      },
      {
        "id": "section-2",
        "courseId": "course-202",
        "name": "Data Visualization",
        "coverImageUrl":
            "https://www.nhbc.co.uk/binaries/content/gallery/nhbccontentmanagementsystem/awards-and-events/pij/2023/best-practice-guides-thumbnails/2.png"
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
