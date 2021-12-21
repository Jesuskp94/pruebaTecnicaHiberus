import 'package:flutter/material.dart';
import 'package:magichiberus/data/providers/cartas_provider.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:provider/provider.dart';

class CardsPage extends StatelessWidget{
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
          child: FutureBuilder(
            initialData: [],
            future: cartasProvider.getAllCartas(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              return ListView (
                  children: _crearListaItems(snapshot.data, context),
              );
            },
          ),
        )
      )
    );
  }

  List<Widget> _crearListaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> cartas = [];

    data!.forEach((carta) {
      Carta car = carta;
      final widgetTemporal = ListTile(
        title: Text(car.name),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
        },
      );

      cartas..add(widgetTemporal)..add(Divider(thickness: 2,));
    });
    return cartas;
  }
}