// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'],
      description: json['description'] as String,
      name: json['name'] as String,
      isFavorite: json['isFavorite'] as bool,
      imageUrl: json['imageUrl'] as String,
      courseSections: (json['courseSections'] as List<dynamic>?)
              ?.map((e) => CourseSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isFavorite': instance.isFavorite,
      'imageUrl': instance.imageUrl,
      'courseSections': instance.courseSections,
    };
