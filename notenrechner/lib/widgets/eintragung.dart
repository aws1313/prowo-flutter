
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';


class EintragNote extends StatefulWidget {
  bool eintragBool;
  
  EintragNote({super.key, required this.eintragBool});

  

  @override
  State<EintragNote> createState() => _EintragNoteState();
}

class _EintragNoteState extends State<EintragNote> {
  var box = Hive.box('noten');
  String dropVal = 'hi';
  TextEditingController textController = TextEditingController();
  String selectedValue = 'Deutsch';

 

  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: 'Deutsch', child: Text('Deutsch')),
    const DropdownMenuItem(value: 'Mathe', child: Text('Mathe')),
    const DropdownMenuItem(value: 'Latein', child: Text('Latein')),
    const DropdownMenuItem(value: 'Englisch', child: Text('Englisch')),
    const DropdownMenuItem(value: 'Geschichte', child: Text('Geschichte')),
    const DropdownMenuItem(value: 'Politik', child: Text('Politik')),
    const DropdownMenuItem(value: 'Sport', child: Text('Sport')),
    const DropdownMenuItem(value: 'Kunst', child: Text('Kunst')),
    const DropdownMenuItem(value: 'Musik', child: Text('Musik')),
    const DropdownMenuItem(value: 'Physik', child: Text('Physik')),
    const DropdownMenuItem(value: 'Chemie', child: Text('Chemie')),
    const DropdownMenuItem(value: 'Biologie', child: Text('Biologie')),
    const DropdownMenuItem(value: 'Informatik', child: Text('Informatik')),
    const DropdownMenuItem(value: 'Religion', child: Text('Religion')),
    const DropdownMenuItem(value: 'Ethik', child: Text('Ethik')),
    const DropdownMenuItem(value: 'Wirtschaft', child: Text('Wirtschaft')),
    const DropdownMenuItem(value: 'Geographie', child: Text('Geographie')),
    const DropdownMenuItem(value: 'Französisch', child: Text('Französisch')),
    const DropdownMenuItem(value: 'Spanisch', child: Text('Spanisch')),
    const DropdownMenuItem(value: 'Italienisch', child: Text('Italienisch')),
  ];

  void onChanged(Object? value) {
    setState(() {
      dropVal = value.toString();
      selectedValue = value.toString();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Visibility(visible: widget.eintragBool,child: Card(
      child:Padding(padding: EdgeInsets.all(20),
      child: Column(
      children: [
        DropdownButton(value: selectedValue,onChanged: onChanged,items:items),
         TextField(
          controller: textController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Note',
          ),
        ),
        ElevatedButton(
          onPressed: () async{
            
            var notenSummen =  box.get(dropVal)['summe'];
            var notenAnzahl = box.get(dropVal)['anzahl'];

            box.put(dropVal, {'summe': notenSummen + double.parse(textController.text), 'anzahl': notenAnzahl + 1}); 
            
            setState(() {
              widget.eintragBool = false;
            });
          },
          child: const Text('Eintragen'),
        ),
      ],
    ),)
    )
    );
  }
}