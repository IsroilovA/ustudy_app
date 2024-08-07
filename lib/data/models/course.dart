import 'package:uuid/uuid.dart';

const uuid = Uuid();

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
}
