import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:magichiberus/ui/utils/breakpoints.dart';

class DetallesCarta extends StatelessWidget {

  final Carta carta;

  const DetallesCarta({required this.carta});

  //TODO: mover a un widget interno del widget card_list
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, dimes) {
      if(dimes.maxWidth >= kTabletBreakpoint){
        return bodyDetalles(size);
      }else{
        return Scaffold(
          appBar: AppBar(title: Text(carta.name),backgroundColor: Colors.green,),
          body: bodyDetalles(size),
          backgroundColor: Colors.green[200],
        );
      }
    });
  }

  Widget comprobarURLImagen(String url){
    if (url.isNotEmpty){
      return Image.network(
        this.carta.imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        fit: BoxFit.contain,
      );
    }else{
      return Image.asset('assets/image-not-found.jpg');
    }
  }

  Widget bodyDetalles(Size size) {
    return SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  comprobarURLImagen(this.carta.imageUrl)
                ],
              ),
            ),
            Divider(thickness: 2,indent: 200.0,endIndent: 200.0,),
            Text('Detalles',
              style: GoogleFonts.ubuntu(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
            Divider(
              thickness: 2,
              endIndent: size.width * 0.7,
            color: Colors.green,),
            Text(
              'Esta carta ha sido pintada por el artista ${this.carta.artist},'
              ' su coste de maná convertido es de un total de ${this.carta.cmc.toInt()} manás.\n'
              'Pertenece al set de "${this.carta.setName}" (${this.carta.set}).\n'
              'Su rareza entra dentro del rango de "${this.carta.rarity}".\n'
              'El poder y defensa de ésta carta son de ${this.carta.power}/${this.carta.toughness}',
              style: GoogleFonts.ubuntu(fontSize: 17,)
            ),
            Divider(thickness: 2,),
            Text('Texto:',
              style: GoogleFonts.ubuntu(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
            ),
            Text('${this.carta.text}', style: GoogleFonts.ubuntu(fontSize: 17,)),
          ],
        ),
      ),
    );
  }
}
