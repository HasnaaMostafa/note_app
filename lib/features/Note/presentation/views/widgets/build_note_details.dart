import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/add_task_button.dart';
import '../../../data/models/note_model.dart';
import '../../views_models/add_note_cubit/add_note_cubit.dart';
import 'colors_list_view.dart';
import 'custom_date_text_field.dart';
import 'custom_drop_menu_repeat.dart';
import 'custom_text_field.dart';
import 'custom_time_text_fields.dart';

class BuildNoteDetails extends StatelessWidget {
  const BuildNoteDetails({
    super.key,
    required this.buttonName,
  });

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Title",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        CustomTextField(
          onSaved: (value) {
            title = value;
          },
          hintN: "Enter Title Here",
        ),
        const Text(
          "Note",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        CustomTextField(
          onSaved: (value) {
            subTitle = value;
          },
          maxLines: 4,
          hintN: "Enter Note Here",
        ),
        const Text(
          "Date",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const CustomDateTextField(),
        const CustomTimeTextFields(),
        // const Text(
        //   "Remind",
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
        // CustomDropMenuOfRemind(remindList: remindList),
        const Text(
          "Repeat",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        CustomDropMenuOfRepeat(repeatList: repeatList),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ColorListView(),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return AddTaskButton(
              isLoading: state is AddNoteLoadingState ? true : false,
              onTap: () {
                // var currentDate = DateTime.now();
                //
                // var formattedDate = DateFormat.yMd().format(currentDate);

                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var noteModel = NoteModel(
                      time: sTime!,
                      title: title!,
                      subTitle: subTitle!,
                      date: date!,
                      color: Colors.blue.value,
                      repeat: repeat!);

                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                }
              },
              buttonName: buttonName,
              backgroundColor: const Color(0xff0E6655),
            );
          },
        ),
      ],
    );
  }
}
