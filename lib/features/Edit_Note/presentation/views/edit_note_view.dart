import 'package:flutter/material.dart';
import 'package:note_app/features/Edit_Note/presentation/views/widgets/edit_note_body_view.dart';
import 'package:note_app/features/Note/data/models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return EditNoteBodyView(
      noteModel: noteModel,
    );
  }
}
