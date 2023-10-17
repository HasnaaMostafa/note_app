import 'package:flutter/material.dart';

class NoteColor extends StatelessWidget {
  const NoteColor({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 5),
      child: isActive
          ? Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: color,
                ),
                const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 15,
                ),
              ],
            )
          : CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
    );
  }
}
