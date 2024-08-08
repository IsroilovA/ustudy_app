part of 'admin_panel_cubit.dart';

@immutable
sealed class AdminPanelState {}

final class AdminPanelInitial extends AdminPanelState {}

final class AdminPanelDelete extends AdminPanelState {}

final class AdminPanelCoursesLoaded extends AdminPanelState {
  final List<Course> courses;
  AdminPanelCoursesLoaded(this.courses);
}

final class AdminPanelCoursesLoading extends AdminPanelState {}

final class AdminPanelNoCourses extends AdminPanelState {}

final class AdminPanelError extends AdminPanelState {
  final String? message;

  AdminPanelError(this.message);
}
