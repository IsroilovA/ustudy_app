import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ustudy_app/data/models/course.dart';
import 'package:ustudy_app/services/ustudy_repository.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(
      {required UstudyRepository ustudyRepository, required bool isAdmin})
      : _ustudyRepository = ustudyRepository,
        super(CoursesInitial(isAdmin: isAdmin));

  final UstudyRepository _ustudyRepository;

  void loadCourses() async {
    emit(CoursesLoading(isAdmin: state.isAdmin));
    try {
      var courses = await _ustudyRepository.getCourses();
      if (courses.isEmpty) {
        emit(NoCourses(isAdmin: state.isAdmin));
      } else {
        emit(CoursesLoaded(courses, isAdmin: state.isAdmin));
      }
    } catch (e) {
      emit(CoursesError(e.toString(), isAdmin: state.isAdmin));
    }
  }
}
