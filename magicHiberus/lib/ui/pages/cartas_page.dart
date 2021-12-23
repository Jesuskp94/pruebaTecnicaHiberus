import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magichiberus/data/providers/cartas_provider.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:provider/provider.dart';

class CardsPage extends StatefulWidget{
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  int _posicionActual = 0;

  @override
  Widget build(BuildContext context) {

    final cartasProvider = Provider.of<CartasProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold (
      appBar: AppBar(title: Text('CardsPage'),),
      body: Center(
        child: FutureBuilder(
          initialData: [],
          future: cartasProvider.getAllCartas(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [

                  CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * 0.7 - 100,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, direccion) {
                        setState(() {
                          _posicionActual = index;
                        });
                      }
                    ),
                    items: _crearListaItems(snapshot.data, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.map((urlOfItem) {
                      int index = snapshot.data!.indexOf(urlOfItem);
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _posicionActual == index
                              ? Color.fromRGBO(0, 0, 0, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );

          },
        ),
      )
    );
  }

  List<Widget> _crearListaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> cartas = [];
    data!.forEach((element) {
      Carta carta = element;
      if (carta.imageUrl.isEmpty){
        cartas..add(Image.asset('assets/image-not-found.jpg'));
      }else{
        final widgetTemporal = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(carta.imageUrl,
                fit: BoxFit.contain,
              )
            ],
          ),
        );
        cartas..add(widgetTemporal);
      }
    });

    return cartas;
  }
}