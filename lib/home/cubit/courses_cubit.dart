import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'courses_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
}
