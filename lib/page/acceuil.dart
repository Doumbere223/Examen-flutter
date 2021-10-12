import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({Key key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acceuil")),
      body: Center(
        child: Text('Acceuil', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
