import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notenrechner/widgets/eintragung.dart';
import 'package:notenrechner/widgets/schnitt.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  
  Hive.initFlutter(); // Hivwe (interner Speicher) wird aufgesetzt
  var box = await Hive.openBox('noten'); // kreiere eine Box mit dem Namen 'noten'
   List<String> facherListe = ['Deutsch','Mathe','Latein','Englisch','Geschichte','Politik','Sport','Kunst','Musik','Physik','Chemie','Biologie','Informatik','Religion','Ethik','Wirtschaft','Geographie','Französisch','Spanisch','Italienisch']; // Liste  mit Fächern
  for (var i = 0; i < facherListe.length; i++) {
    box.put(facherListe[i], {'summe': 0.0, 'anzahl': 0});
  } // für jedes Fach in der Liste wird ein Eintrag in der Box erstellt

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notenschnitt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, secondary: Colors.red, primary: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notenschnitt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool eintragBool = false;// ja/nein ob ein Eintrag gemacht werden soll
  var box = Hive.box('noten');
  List<String> facherListe = ['Deutsch','Mathe','Latein','Englisch','Geschichte','Politik','Sport','Kunst','Musik','Physik','Chemie','Biologie','Informatik','Religion','Ethik','Wirtschaft','Geographie','Französisch','Spanisch','Italienisch'];


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
  appBar: AppBar(
    title: Text(widget.title),
  ),
  body: Center(child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 100,
        width: 100,
        child: Schnitt() // siehe Schnitt widget
      ),// Der Gesammtschnitt
      
      
      EintragNote( eintragBool: eintragBool,),// sihe EintragNote widget, nimmt eintragbool als parameter
      FloatingActionButton(
        onPressed: () {
          setState(() {
            eintragBool = true;
          });
        },
        child: const Icon(Icons.add),
      ), // der Button um eine Note hinzu zu fügen

      
    for (var fach in facherListe) // kreire für jedes Fach ein Text widget
  ValueListenableBuilder(
    valueListenable: Hive.box('noten').listenable(keys: [fach]), // wenn sich die Box 'noten' ändert, wird das widget neu aufgebaut
    builder: (context, Box box, widget) {
      final summe = box.get(fach)['summe'];
      final anzahl = box.get(fach)['anzahl'];
      // schauen ob anzahl 0 ist
      if (anzahl == 0) {
        return const SizedBox.shrink(); // mache das widget unsichtbar wenn anzahl 0 ist
      }
      final result = summe / anzahl;
      // checke ob result NaN ist
      if (result.isNaN) {
        return const SizedBox.shrink(); // mache das widget unsichtbar wenn result NaN ist
      } else {
        return Card(
          child: ListTile(
            title: Text(fach),
            subtitle: Text('Schnitt: ${result.toStringAsFixed(1)}'),
          ),
        );
      }
    },
  ),
    ],
  ),
     ),
);
  }
}
