import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../Home/presentation/views_models/note_cubit/note_cubit.dart';
import '../../../data/models/note_model.dart';
import '../../views_models/add_note_cubit/add_note_cubit.dart';
import 'build_note_details.dart';
import 'custom_note_app_bar.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Scaffold(
        body: Column(
          children: [
            CustomNoteAppBar(
              onPressed: () {
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
              formKey: formKey,
              title: "Add Note",
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                child: BlocConsumer<AddNoteCubit, AddNoteState>(
                    listener: (context, state) {
                  if (state is AddNoteErrorState) {
                    debugPrint("failed ${state.error}");
                  }
                  if (state is AddNoteSuccessState) {
                    BlocProvider.of<NoteCubit>(context).fetchNotes();
                    Navigator.pop(context);
                  }
                }, builder: (context, state) {
                  return AbsorbPointer(
                    absorbing: state is AddNoteLoadingState ? true : false,
                    child: const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: BuildNoteDetails(
                          buttonName: "Create Note",
                        )),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
