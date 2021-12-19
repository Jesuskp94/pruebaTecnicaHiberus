import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  static final String titulo = "Magic Hiberus";

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: titulo,
      home: Scaffold(
        appBar: AppBar(title: Text(titulo),),
        body: Center(child: Text("Comenzando"),)
      ),
    );
  }
}