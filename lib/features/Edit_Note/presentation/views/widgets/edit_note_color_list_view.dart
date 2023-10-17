import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../Note/data/models/note_model.dart';
import '../../../../Note/presentation/views/widgets/note_color.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.noteModel.color = colors[index].value;
                setState(() {});
              },
              child: NoteColor(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            );
          }),
    );
  }
}
