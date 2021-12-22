import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Text('About me'),),
      body: Center(
        child: Text("Pagina del home en la que tengo que poner todos mis datos"),
      ),
    );
  }
}