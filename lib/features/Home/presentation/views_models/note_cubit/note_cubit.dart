import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../Note/data/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitialState());

  List<NoteModel>? notes;
  fetchNotes() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);

    notes = noteBox.values.toList();
    emit(NoteSuccessState());
  }
}
