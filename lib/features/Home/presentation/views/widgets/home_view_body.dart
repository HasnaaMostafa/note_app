import 'package:flutter/material.dart';

import '../../../../../core/widgets/add_task_button.dart';
import '../../../../Note/presentation/views/add_note_view.dart';
import 'custom_app_bar.dart';
import 'note_item_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 12, left: 6, top: 15),
        child: Column(
          children: [
            const CustomAppBar(),
            AddTaskButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AddTaskView()));
              },
              buttonName: "+ Add Note",
              backgroundColor: Colors.grey.shade700,
            ),
            const NoteItemListView(),
          ],
        ),
      ),
    );
  }
}
