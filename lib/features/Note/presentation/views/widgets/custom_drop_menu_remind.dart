import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constants.dart';

import 'custom_text_field.dart';

class CustomDropMenuOfRemind extends StatefulWidget {
  const CustomDropMenuOfRemind({
    super.key,
    required this.remindList,
  });

  final List<String> remindList;

  @override
  State<CustomDropMenuOfRemind> createState() => _CustomDropMenuOfRemindState();
}

class _CustomDropMenuOfRemindState extends State<CustomDropMenuOfRemind> {
  String? selectedValue;
  TextEditingController remindController = TextEditingController();

  @override
  void initState() {
    super.initState();
    remindController.text = widget.remindList[0];
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: remindController,
      hintN: selectedValue ?? remindList[0],
      suffixIcon: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: DropdownButton<String>(
          padding: EdgeInsets.zero,
          underline: const SizedBox(
            width: 0,
          ),
          value: selectedValue ?? remindList[0],
          style: const TextStyle(color: Color(0xff62FCD7)),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
              remindController.text = value!;
            });
          },
          items:
              widget.remindList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ),
    );
  }
}
