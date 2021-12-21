import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  static final String titulo = "Magic Hiberus";

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: titulo,
      home: Scaffold(
        appBar: AppBar(title: Text(titulo),),
        body: Center(
          child: Text("Pagina del home en la que tengo que poner todos mis datos"),
        ),
      )
    );
  }
}