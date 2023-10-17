import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Note/data/models/note_model.dart';
import '../../views_models/note_cubit/note_cubit.dart';
import 'note_item.dart';

class NoteItemListView extends StatelessWidget {
  const NoteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<NoteCubit>(context).notes ?? [];
          return ListView.builder(
              itemCount: notes.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return NoteItem(
                  noteModel: notes[index],
                );
              });
        },
      ),
    );
  }
}
