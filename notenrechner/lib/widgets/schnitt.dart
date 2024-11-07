import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



class Schnitt extends StatelessWidget {
  Schnitt({super.key});

  final List<String> facherListe = [
    'Deutsch', 'Mathe', 'Latein', 'Englisch', 'Geschichte', 'Politik', 'Sport', 'Kunst', 'Musik', 'Physik', 'Chemie', 'Biologie', 'Informatik', 'Religion', 'Ethik', 'Wirtschaft', 'Geographie', 'Französisch', 'Spanisch', 'Italienisch'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box('noten').listenable(),
                builder: (context, Box box, widget) {
                double totalAverage = 0;
                int count = 0;
                for (var fach in facherListe) {
                  var data = box.get(fach);
                  if (data != null && data['summe'] is num && data['anzahl'] is num && data['anzahl'] != 0) {
                    double summe = data['summe'].toDouble();
                    double anzahl = data['anzahl'].toDouble();
                    if (summe.isFinite && anzahl.isFinite && anzahl > 0) {
                      double average = summe / anzahl;
                      totalAverage += average;
                      count++;
        }
      }
    }//checke ob count 0 ist und rechnen den Schnitt aus
    double overallAverage = count > 0 ? totalAverage / count : 0;
    return Text("Gesamtschnitt: ${overallAverage.toStringAsFixed(1)}");
  },// der Gesammt schnitt
),
          ],
        ),
      ),
    );
  }
}
 