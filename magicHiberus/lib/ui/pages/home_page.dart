import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  var nombre = 'Jesus Ortiz';
  var email = 'jesusortiz@hotmail.com';
  var phone = '648 44 70 82';
  var linkedin = 'jesus-ortiz-capellan-l94';
  var date = '19/12/2021';

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