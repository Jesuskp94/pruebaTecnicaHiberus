import 'package:flutter/material.dart';
import 'package:magichiberus/ui/widgets/cartas_page/card_list.dart';
import 'package:magichiberus/ui/widgets/cartas_page/card_swiper.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  bool _cambiarVista = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(
        title: Text('CardsPage'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.compare_arrows,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _cambiarVista = !_cambiarVista;
              });
            },
          )
        ],
      ),
      body: manejadorWidgetCartas(),
      backgroundColor: Colors.green[200],
    );
  }

  Widget manejadorWidgetCartas(){
    return (_cambiarVista) ? ListaCartas() : CardSwiper();
  }
}