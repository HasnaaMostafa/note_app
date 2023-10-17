import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/Note/data/models/note_model.dart';
import 'package:note_app/features/Note/presentation/views/widgets/custom_note_app_bar.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../Home/presentation/views/home_view.dart';
import '../../../../Home/presentation/views_models/note_cubit/note_cubit.dart';
import '../../../../Note/presentation/views/widgets/custom_date_text_field.dart';
import '../../../../Note/presentation/views/widgets/custom_drop_menu_repeat.dart';
import '../../../../Note/presentation/views/widgets/custom_text_field.dart';
import '../../../../Note/presentation/views/widgets/custom_time_text_fields.dart';
import 'edit_note_color_list_view.dart';

class EditNoteBodyView extends StatefulWidget {
  const EditNoteBodyView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteBodyView> createState() => _EditNoteBodyViewState();
}

class _EditNoteBodyViewState extends State<EditNoteBodyView> {
  String? title, subTitle, sTime, date, repeat;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomNoteAppBar(
                formKey: formKey,
                title: "Edit Note",
                onPressed: () {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.subTitle =
                      subTitle ?? widget.noteModel.subTitle;
                  widget.noteModel.date = date ?? widget.noteModel.date;
                  widget.noteModel.time = sTime ?? widget.noteModel.time;
                  widget.noteModel.repeat = repeat ?? widget.noteModel.repeat;
                  widget.noteModel.save();

                  BlocProvider.of<NoteCubit>(context).fetchNotes();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomeView()),
                    (route) => false,
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      onChange: (value) {
                        title = value;
                      },
                      hintN: widget.noteModel.title,
                    ),
                    const Text(
                      "Note",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      onChange: (value) {
                        subTitle = value;
                      },
                      maxLines: 4,
                      hintN: widget.noteModel.subTitle,
                    ),
                    const Text(
                      "Date",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CustomDateTextField(
                      onChange: (value) {
                        date = value;
                      },
                      hintN: widget.noteModel.date,
                    ),
                    CustomTimeTextFields(
                      hintN: widget.noteModel.time,
                      onChange: (value) {
                        sTime = value;
                      },
                    ),
                    // const Text(
                    //   "Remind",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    // ),
                    // CustomDropMenuOfRemind(remindList: remindList),
                    const Text(
                      "Repeat",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CustomDropMenuOfRepeat(
                      repeatList: repeatList,
                      onChange: (value) {
                        repeat = value;
                      },
                      hintN: widget.noteModel.repeat,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        EditNoteColorListView(
                          noteModel: widget.noteModel,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
