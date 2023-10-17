import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../views_models/add_note_cubit/add_note_cubit.dart';
import 'note_color.dart';

class ColorListView extends StatelessWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<AddNoteCubit>(context).selectColor(index);
                },
                child: NoteColor(
                  isActive: BlocProvider.of<AddNoteCubit>(context)
                          .selectedColorIndex ==
                      index,
                  color: colors[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
