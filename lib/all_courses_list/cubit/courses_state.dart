part of 'courses_cubit.dart';

@immutable
sealed class CoursesState {
  final bool isAdmin;
  const CoursesState({required this.isAdmin});
}

final class CoursesInitial extends CoursesState {
  const CoursesInitial({required super.isAdmin});
}

final class CoursesLoaded extends CoursesState {
  final List<Course> courses;

  const CoursesLoaded(this.courses, {required super.isAdmin});
}

final class FavoriteCoursesLoaded extends CoursesState {
  final List<Course> courses;

  const FavoriteCoursesLoaded(this.courses, {required super.isAdmin});
}

final class CoursesLoading extends CoursesState {
  const CoursesLoading({required super.isAdmin});
}

final class NoCourses extends CoursesState {
  const NoCourses({required super.isAdmin});
}

final class CoursesError extends CoursesState {
  final String? message;
  const CoursesError(this.message, {required super.isAdmin});
}
