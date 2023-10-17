import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constants.dart';

import 'custom_text_field.dart';

class CustomDropMenuOfRepeat extends StatefulWidget {
  const CustomDropMenuOfRepeat({
    super.key,
    required this.repeatList,
    this.hintN,
    this.onChange,
  });

  final List<String> repeatList;

  final String? hintN;
  final void Function(String?)? onChange;

  @override
  State<CustomDropMenuOfRepeat> createState() => _CustomDropMenuOfRepeatState();
}

class _CustomDropMenuOfRepeatState extends State<CustomDropMenuOfRepeat> {
  @override
  void initState() {
    super.initState();
    repeatController.text = widget.hintN ?? widget.repeatList[0];
  }

  String? selectedValue;
  TextEditingController repeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChange: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      onSaved: (value) {
        repeat = value;
      },
      controller: repeatController,
      hintN: widget.hintN ?? selectedValue ?? repeatList[0],
      suffixIcon: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: DropdownButton<String>(
          padding: EdgeInsets.zero,
          underline: const SizedBox(
            width: 0,
          ),
          value: selectedValue ?? repeatList[0],
          style: const TextStyle(color: Colors.grey),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
              repeatController.text = value!;
            });
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          items:
              widget.repeatList.map<DropdownMenuItem<String>>((String value) {
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
