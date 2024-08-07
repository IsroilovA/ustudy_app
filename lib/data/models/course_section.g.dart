// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSection _$CourseSectionFromJson(Map<String, dynamic> json) =>
    CourseSection(
      courseId: json['courseId'] as String,
      name: json['name'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      id: json['id'],
    );

Map<String, dynamic> _$CourseSectionToJson(CourseSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'name': instance.name,
      'coverImageUrl': instance.coverImageUrl,
    };
