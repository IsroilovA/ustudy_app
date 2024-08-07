import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ustudy_app/data/models/course.dart';
import 'package:ustudy_app/services/ustudy_repository.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit({required UstudyRepository ustudyRepository})
      : _ustudyRepository = ustudyRepository,
        super(CoursesInitial());

  final UstudyRepository _ustudyRepository;

  void loadCourses() async {
    emit(CoursesLoading());
    try {
      var courses = await _ustudyRepository.getCourses();
      if (courses.isEmpty) {
        emit(NoCourses());
      } else {
        emit(CoursesLoaded(courses));
      }
    } catch (e) {
      emit(CoursesError(e.toString()));
    }
  }
}
