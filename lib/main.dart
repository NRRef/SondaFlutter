import 'package:flutter/material.dart';
import 'package:sonda_flutter/Views/Home.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sonda Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'Sonda Flutter'),
    );
  }
}
