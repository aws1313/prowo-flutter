import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:hausaufgabenheft/homework.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  DateTime? dueDate;

  void _add() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context,
          Homework(titleController.text, contentController.text, dueDate!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        //title: const Text("Hausaufgabe hinzufügen"),
        child: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
              Text(
                "HA eintragen",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(onPressed: () => _add(), child: Text("Hinzufügen")),
            ],
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Title";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: contentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Content";
                      }
                      return null;
                    },
                  ),
                  DateTimeFormField(
                    validator: (value) {
                      if (dueDate == null) {
                        return "Please enter date";
                      }
                      return null;
                    },
                    onChanged: (dt) {
                      dueDate = dt;
                    },
                    mode: DateTimeFieldPickerMode.date,
                  )
                ],
              )),
        ],
      ),
    )));
  }
}
