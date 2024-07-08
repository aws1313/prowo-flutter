import 'package:flutter/material.dart';
import 'package:hausaufgabenheft/homework.dart';

class HomeworkCard extends StatefulWidget {
  final Homework homework;
  const HomeworkCard(this.homework, {super.key});

  @override
  State<HomeworkCard> createState() => _HomeworkCardState();
}

class _HomeworkCardState extends State<HomeworkCard> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [Text(widget.homework.title), Text(widget.homework.content)],
      ),
    );
  }
}
