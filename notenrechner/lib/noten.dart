import 'package:hive/hive.dart';
part 'noten.g.dart';

@HiveType(typeId: 0) // Ensure typeId is unique for each HiveObject type
class MyObject extends HiveObject {
  @HiveField(0)
   double summe = 0.0;

  @HiveField(1)
  int anzahl = 0;

  // You can add more fields here
}

