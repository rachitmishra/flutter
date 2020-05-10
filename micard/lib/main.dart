import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MiCard(title: 'MiCard'),
    );
  }
}

class MiCard extends StatefulWidget {
  MiCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MiCardState createState() => _MiCardState();
}

class _MiCardState extends State<MiCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.amber, body: Center());
  }
}
