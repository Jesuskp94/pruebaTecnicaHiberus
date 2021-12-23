import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:magichiberus/data/providers/cartas_provider.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardSwiper extends StatefulWidget {

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  int _posicionActual = 0;

  @override
  Widget build(BuildContext context) {

    final cartasProvider = Provider.of<CartasProvider>(context);
    final size = MediaQuery.of(context).size;

    return Center(
      child: FutureBuilder(
        initialData: [],
        future: cartasProvider.getAllCartas(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: size.height * 0.6,
                      aspectRatio: 4/3,
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
                SizedBox(height: 20,),
                dotIndicator(snapshot.data!.length)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget dotIndicator(int length) => AnimatedSmoothIndicator(
    activeIndex: _posicionActual,
    count: length,
    effect: ScrollingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.grey,
        activeDotColor: Colors.black),
  );

  List<Widget> _crearListaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> cartas = [];
    Widget widgetTemporal;
    data!.forEach((element) {
      Carta carta = element;
      //TODO: he hecho trampitas para la prueba, esto es corregible
      /*if (carta.imageUrl.isEmpty){
        widgetTemporal = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(carta.name),
            SizedBox(height: 10,),
            Image.asset('assets/image-not-found.jpg')
          ],
        );
        cartas..add(widgetTemporal);
      }else{*/
      if (carta.imageUrl.isNotEmpty){
        widgetTemporal = ClipRRect(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(
                carta.imageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
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
