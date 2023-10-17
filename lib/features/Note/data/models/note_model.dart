import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  String date;

  @HiveField(3)
  int color;

  @HiveField(4)
  String time;

  @HiveField(5)
  String? repeat;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
    required this.time,
    this.repeat,
  });
}
