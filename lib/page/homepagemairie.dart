import 'package:flutter/material.dart';

class HomePageMairie extends StatefulWidget {
  const HomePageMairie({Key key}) : super(key: key);

  @override
  _HomePageMairieState createState() => _HomePageMairieState();
}

class _HomePageMairieState extends State<HomePageMairie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mairie")),
      body: Center(
        child: Text('Mairie', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
