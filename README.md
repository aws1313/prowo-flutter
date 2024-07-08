<h2 style="text-align: center;">Projektwoche AES 2024<br>- Apps programmieren -<br><br></h2>

In diesem Projekt lernt Ihr, wie ihr Apps für die verschiedensten Plattformen programmieren könnt und Eure eigenen Ideen umsetzt.

Am Ende der Woche werdet Ihr eine Idee umgesetzt haben, die am Schulfest dann vorgestellt werden können.

In diesem Dokument findet Ihr Hilfestellungen und Beispiele.

---
<h2>Inhalt</h2>

- [Warum Flutter und Dart?](#warum-flutter-und-dart)
- [Grundsätzliche Syntax](#grundsätzliche-syntax)
  - [Grundstruktur Flutter](#grundstruktur-flutter)
    - [Main-Funktion](#main-funktion)
    - [Root App](#root-app)
    - [Navigator](#navigator)
    - [Built-in Funktionen](#built-in-funktionen)
  - [Variablen](#variablen)
  - [Klassen](#klassen)
  - [Funktionen](#funktionen)
  - [Bedingungen](#bedingungen)
- [Widgets](#widgets)
- [Erweiterung durch Pakete](#erweiterung-durch-pakete)
  - [pubspec.yaml](#pubspecyaml)
  - [in Dart importieren](#in-dart-importieren)
- [Nützliches](#nützliches)


## Warum Flutter und Dart?

## Grundsätzliche Syntax

### Grundstruktur Flutter
#### Main-Funktion
```dart
// main.dart
void main() {
    runApp(MyApp());
}
```
#### Root App
```dart
class MeineApp extends StatelessWidget {
  const MeineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyan, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomePage(), // Die Hauptseite, von der alles ereichbar ist
    );
  }
}
```

#### Navigator

#### Built-in Funktionen
```dart
print("Hallo Welt!");
```

### Variablen
```dart
bool bedingung = true;
int alter = 0;
String name = "Max";
Haustier meineKatze = Haustier(name, alter);
```

### Klassen
```dart
class Haustier {
    Haustier(this.name, this.alter); // Konstruktor

    String name;
    int alter;
}
```

### Funktionen
```dart
int meineFunktion(String name){
    return 1;
}
```
### Bedingungen
```dart
bool bedingung = false;
bool bedingung2 = true;

if (bedingung){
    print("hi");
}

if (bedingung){
    print("1");
} else if (bedingung2){
    print("2");
} else {
    print("3");
}
```
## Widgets

## Erweiterung durch Pakete
### pubspec.yaml

### in Dart importieren


## Nützliches
- [Dart & Flutter Pakete](https://pub.dev)
- [Flutter Dokumentation](https://docs.flutter.dev/ui)