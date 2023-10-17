import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/Note/data/models/note_model.dart';

import '../../../../Edit_Note/presentation/views/widgets/edit_note_body_view.dart';
import '../../views_models/note_cubit/note_cubit.dart';
import 'custom_button.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  height: 120,
                  child: VerticalDivider(
                    thickness: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    context: context,
                    builder: (BuildContext context) => SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Divider(
                                  thickness: 5,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              CustomButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EditNoteBodyView(
                                                noteModel: noteModel,
                                              )));
                                },
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                buttonName: "Edit Note",
                              ),
                              CustomButton(
                                onTap: () {
                                  noteModel.delete();
                                  BlocProvider.of<NoteCubit>(context)
                                      .fetchNotes();
                                  Navigator.pop(context);
                                },
                                backgroundColor: const Color(0xffCD5C5C),
                                buttonName: "Delete Note",
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomButton(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                backgroundColor: Colors.grey.withOpacity(0.7),
                                buttonName: "Cancel",
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ));
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(noteModel.color),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        noteModel.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 20),
                        child: Text(
                          noteModel.subTitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_outlined,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(noteModel.time),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(noteModel.date),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Repeat : ${noteModel.repeat}"),
                              ],
                            )
                          ],
                        ),
                      )

                      // Align(
                      //   alignment: AlignmentDirectional.bottomEnd,
                      //   child: IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         FontAwesomeIcons.trash,
                      //         size: 24,
                      //         color: Colors.black,
                      //       )),
                      // ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

//const Spacer(),
//                       SizedBox(
//                         height: 50,
//                         child: VerticalDivider(
//                           thickness: 2,
//                           color: Colors.white.withOpacity(0.2),
//                         ),
//                       ),
//                       const RotatedBox(
//                         quarterTurns: 1,
//                         child: Text(
//                           "To Do",
//                         ),
//                       )
