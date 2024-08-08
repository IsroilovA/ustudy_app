import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/admin_panel/cubit/admin_panel_cubit.dart';
import 'package:ustudy_app/data/models/course.dart';
import 'package:ustudy_app/services/utils.dart';

class AddEditCourse extends StatefulWidget {
  const AddEditCourse({super.key, this.course});

  final Course? course;

  @override
  State<AddEditCourse> createState() => _AddEditCourseState();
}

class _AddEditCourseState extends State<AddEditCourse> {
  final _form = GlobalKey<FormState>();

  File? _pickedImage;
  String _enteredName = '';
  String _enteredDescription = '';
  void _submit() {
    final isValid = _form.currentState!.validate();
    if (!isValid || _pickedImage == null) {
      return;
    }
    _form.currentState!.save();
    BlocProvider.of<AdminPanelCubit>(context).addCourse(
      Course(
        description: _enteredDescription,
        name: _enteredName,
        isFavorite: false,
        imageUrl: _pickedImage!.path,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    if (widget.course != null) {
      _enteredName = widget.course!.name;
      _enteredDescription = widget.course!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Text(
                "Название",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextFormField(
                initialValue: _enteredName,
                decoration: InputDecoration(
                  border: customOutileBorder,
                  labelText: 'Введите название курса',
                ),
                autocorrect: true,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Название курса обязательно';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Описание",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextFormField(
                initialValue: _enteredDescription,
                decoration: InputDecoration(
                  border: customOutileBorder,
                  labelText: 'Введите описание курса',
                ),
                autocorrect: true,
                maxLines: 5,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Описание курса обязатльно';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredDescription = value!;
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Обложка",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<AdminPanelCubit>(context).pickImage(
                    context: context,
                    onPickImage: (pickedImage) {
                      setState(() {
                        _pickedImage = pickedImage;
                      });
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  height: 200,
                  child: _pickedImage != null
                      ? Image.file(_pickedImage!)
                      : Center(
                          child: Text(
                            "Выбрать фотографию",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.save),
                    label: const Text("Сохранить")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
