import 'package:flutter/material.dart';
import 'package:prefs_guard/prefsguard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrefsGuardExample(),
    );
  }
}

class PrefsGuardExample extends StatefulWidget {
  @override
  _PrefsGuardExampleState createState() => _PrefsGuardExampleState();
}

class _PrefsGuardExampleState extends State<PrefsGuardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Wtite To Prefs'),
              onPressed: () => _writeToPrefs(GuardType.AES),
              color: Colors.blue,
            ),
            RaisedButton(
              child: Text('Read from prefs'),
              onPressed: () => _readFromPrefs(GuardType.AES),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  _writeToPrefs(GuardType type) async {
    switch (type) {
      case GuardType.AES:
        {
          final prefs = PrefsGuard(GuardType.AES);
          prefs.write(key: 'hello', value: 'flutter');
        }
        break;
      case GuardType.Salsa20:
        {
          final prefs = PrefsGuard(GuardType.Salsa20);
          prefs.write(key: 'hello', value: 'flutter');
        }
        break;
      case GuardType.FerNet:
        {
          final prefs = PrefsGuard(GuardType.FerNet);
          prefs.write(key: 'hello', value: 'flutter');
        }
        break;
    }
  }

  _readFromPrefs(GuardType type) async {
    switch (type) {
      case GuardType.AES:
        {
          final prefs = PrefsGuard(GuardType.AES);
          String value = await prefs.read(key: 'hello');
          print(value);
        }
        break;
      case GuardType.Salsa20:
        {
          final prefs = PrefsGuard(GuardType.Salsa20);
          String value = await prefs.read(key: 'hello');
          print(value);
        }
        break;
      case GuardType.FerNet:
        {
          final prefs = PrefsGuard(GuardType.FerNet);
          String value = await prefs.read(key: 'hello');
          print(value);
        }
        break;
    }
  }
}
