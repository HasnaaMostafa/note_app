import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_field.dart';

class TimeTextField extends StatefulWidget {
  const TimeTextField(
      {Key? key,
      required this.fieldName,
      this.onSaved,
      this.hintN,
      this.onChange})
      : super(key: key);

  final String fieldName;
  final void Function(String?)? onSaved;
  final String? hintN;
  final void Function(String?)? onChange;

  @override
  State<TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    TimeOfDay time = TimeOfDay.now();
    var formattedTime = DateFormat.jm().format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      time.hour,
      time.minute,
    ));
    timeController.text = widget.hintN ?? formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomTextField(
            onChange: (value) {
              if (widget.onChange != null) {
                widget.onChange!(value);
              }
            },
            onSaved: widget.onSaved,
            controller: timeController,
            hintN: widget.hintN ?? TimeOfDay.now().format(context),
            suffixIcon: IconButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                ).then((pickedTime) {
                  if (pickedTime != null) {
                    setState(() {
                      selectedTime = pickedTime;
                      timeController.text = pickedTime.format(context);
                      if (widget.onChange != null) {
                        widget.onChange!(pickedTime.format(context));
                      }
                    });
                  }
                });
              },
              icon: const Icon(Icons.access_time_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
