import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'course.g.dart';

const uuid = Uuid();

@JsonSerializable()
class Course {
  final String id;
  final String name;
  final bool isFavorite;
  final String imageUrl;

  Course({
    id,
    required this.name,
    required this.isFavorite,
    required this.imageUrl,
  }) : id = id ?? uuid.v4();

  factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
