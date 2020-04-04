import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prefs_guard/prefsguard.dart';


void main()=>runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}


class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_store(),
      ),
    );
  }

  _store() async{







    
    
  }
}

