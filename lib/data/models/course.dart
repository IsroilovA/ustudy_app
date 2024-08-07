import 'package:json_annotation/json_annotation.dart';
import 'package:ustudy_app/data/models/course_section.dart';
import 'package:uuid/uuid.dart';

part 'course.g.dart';

const uuid = Uuid();

@JsonSerializable()
class Course {
  final String id;
  final String name;
  final String description;
  final bool isFavorite;
  final String imageUrl;
  final List<CourseSection>? courseSections;

  Course({
    id,
    required this.description,
    required this.name,
    required this.isFavorite,
    required this.imageUrl,
    this.courseSections = const [],
  }) : id = id ?? uuid.v4();

  factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
