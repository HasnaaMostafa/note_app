import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/constants/constants.dart';
import 'package:note_app/features/Note/data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  Color color = const Color(0xff095256);

  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;

    emit(AddNoteLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);

      await noteBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (error) {
      emit(AddNoteErrorState(error: error.toString()));
    }
  }
}
