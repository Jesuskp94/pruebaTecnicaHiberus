import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';

class CardSwiper extends StatelessWidget {

  List<Carta> cartas = [];

  CardSwiper (this.cartas);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: cartas.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        //onTap: (int index){print("hola $index");},
        itemBuilder: (BuildContext context, int index) {
          print("itemBuilder: $index");
          return GestureDetector(
            onTap: () { },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/image-not-found.jpg'),
                image: AssetImage('assets/image-not-found.jpg'), //buildImage(index), //TODO: cambiar por la URLimage de cada carta
              ),
            ),
          );
        },
      ),
    );
  }

  ImageProvider buildImage(int index){
    //print("carta número: $index");
    if (cartas.elementAt(index).imageUrl == null) {
      return AssetImage('assets/image-not-found.jpg');
    }
    return NetworkImage('${cartas.elementAt(index).imageUrl}');
  }


}
