import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ustudy_app/data/models/course.dart';
import 'package:ustudy_app/services/ustudy_repository.dart';

part 'admin_panel_state.dart';

class AdminPanelCubit extends Cubit<AdminPanelState> {
  AdminPanelCubit({required UstudyRepository ustudyRepository})
      : _ustudyRepository = ustudyRepository,
        super(AdminPanelInitial());

  final UstudyRepository _ustudyRepository;

  void loadCourses() async {
    emit(AdminPanelCoursesLoading());
    try {
      var courses = await _ustudyRepository.getCourses();
      if (courses.isEmpty) {
        emit(AdminPanelNoCourses());
      } else {
        emit(AdminPanelCoursesLoaded(courses));
      }
    } catch (e) {
      emit(AdminPanelError(e.toString()));
    }
  }
}
