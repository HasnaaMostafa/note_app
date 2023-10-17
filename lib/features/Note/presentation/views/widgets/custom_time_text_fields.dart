import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constants.dart';
import 'package:note_app/features/Note/presentation/views/widgets/time_text_field.dart';

class CustomTimeTextFields extends StatelessWidget {
  const CustomTimeTextFields({
    super.key,
    this.hintN,
    this.onChange,
  });

  final String? hintN;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimeTextField(
          onSaved: (value) {
            sTime = value;
          },
          hintN: hintN,
          onChange: onChange,
          fieldName: "Time",
        ),
        // const TimeTextField(
        //   fieldName: "End Time",
        // )
      ],
    );
  }
}
