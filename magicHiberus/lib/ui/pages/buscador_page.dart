import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Buscadorpage extends StatefulWidget{
  @override
  _BuscadorpageState createState() => _BuscadorpageState();
}

class _BuscadorpageState extends State<Buscadorpage> {

  List<String> elementosPrueba = ['Mortadelo','Filemon','Ofelia','Bacterio','SuperIntendente'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Buscador'),),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 100,
              ),
              items: elementosPrueba.map((e) => ClipRRect(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Text(e),
                  ],
                ),
              )).toList(),
            ),

            Text('Página del buscador'),
            Text('Página del buscador'),

          ],
        )
    );
  }
}