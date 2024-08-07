// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'],
      name: json['name'] as String,
      isFavorite: json['isFavorite'] as bool,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isFavorite': instance.isFavorite,
      'imageUrl': instance.imageUrl,
    };
