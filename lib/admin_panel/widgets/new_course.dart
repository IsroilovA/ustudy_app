import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/admin_panel/cubit/admin_panel_cubit.dart';
import 'package:ustudy_app/services/utils.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  final _form = GlobalKey<FormState>();

  File? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Название",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
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
              onSaved: (value) {},
            ),
            Text(
              "Описание",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
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
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
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
            )
          ],
        ),
      ),
    );
  }
}
