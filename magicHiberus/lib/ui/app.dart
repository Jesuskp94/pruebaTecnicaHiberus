import 'package:flutter/material.dart';
import 'package:magichiberus/data/repositories/carta_provider.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget{
  static final String titulo = "Magic Hiberus";

  @override
  Widget build(BuildContext context) {

    final cartasProvider = Provider.of<CartasProvider>(context);

    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: titulo,
      home: Scaffold(
        appBar: AppBar(title: Text(titulo),),
        body: Center(
          child: Text("Añadiendo las peticiones http")
        ),
      )
    );
  }
}