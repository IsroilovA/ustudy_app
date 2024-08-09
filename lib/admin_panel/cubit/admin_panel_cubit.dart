import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  void pickImage(
      {required BuildContext context,
      required void Function(File pickedImage) onPickImage}) async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 400,
    );
    if (pickedImage == null) {
      return null;
    }
    onPickImage(File(pickedImage.path));
  }

  void deleteCourse(Course course) async {
    try {
      _ustudyRepository.deleteCourse(course);
      emit(AdminPanelInitial());
    } catch (e) {
      emit(AdminPanelError(e.toString()));
    }
  }

  void addCourse(Course course) async {
    try {
      _ustudyRepository.addNewCourse(course);
      emit(AdminPanelInitial());
    } catch (e) {
      emit(AdminPanelError(e.toString()));
    }
  }
}
