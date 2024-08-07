import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'course_section.g.dart';

const uuid = Uuid();

@JsonSerializable()
class CourseSection {
  final String id;
  final String courseId;
  final String name;
  final String coverImageUrl;

  CourseSection(
      {required this.courseId,
      required this.name,
      required this.coverImageUrl,
      id})
      : id = id ?? uuid.v4();

  factory CourseSection.fromJson(Map<String, dynamic> json) =>
      _$CourseSectionFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSectionToJson(this);
}
