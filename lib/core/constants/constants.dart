import 'package:flutter/cupertino.dart';

String kNoteBox = "notes_box";

AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

final List<String> repeatList = <String>['None', 'Daily', 'Weekly', 'Monthly'];

final List<String> remindList = <String>['5', '10', '15', '20'];

String? title, subTitle, repeat, date, sTime;

GlobalKey<FormState> formKey = GlobalKey();

bool isLoading = false;

List<Color> colors = [
  const Color(0xff095256),
  const Color(0xff087F8C),
  const Color(0xff5AAA95),
  const Color(0xffBB9F06),
  const Color(0xffB07BAC),
  const Color(0xffE9BCB7),
];
