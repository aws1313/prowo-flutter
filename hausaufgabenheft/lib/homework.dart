import 'package:hive/hive.dart';

part 'homework.g.dart';

@HiveType(typeId: 0)
class Homework {
  Homework(this.title, this.content, this.dueDate);

  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime dueDate;
  @HiveField(3)
  bool done = false;
}
