import 'dart:convert';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:hausaufgabenheft/add_dialog.dart';
import 'package:hausaufgabenheft/homework_card.dart';
import 'homework.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();
  initializeDateFormatting();
  await Hive.initFlutter();
  Hive.registerAdapter(HomeworkAdapter());
  await Hive.openBox<Homework>("hausaufgaben");
  runApp(const HomeworkApp());
}

class HomeworkApp extends StatelessWidget {
  const HomeworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyan, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomeworkPage(title: 'Homework'),
    );
  }
}

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key, required this.title});

  final String title;

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  Box<Homework> homeworks = Hive.box<Homework>("hausaufgaben");

  void _addHomework(BuildContext context) async {
    Homework? newHomework = await showDialog(
        context: context, builder: (BuildContext con) => AddDialog());
    if (newHomework != null) {
      homeworks.add(newHomework);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ...homeworks.values.map((h) => Container(
                  width: MediaQuery.of(context).size.width,
                  child: HomeworkCard(h),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addHomework(context),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
