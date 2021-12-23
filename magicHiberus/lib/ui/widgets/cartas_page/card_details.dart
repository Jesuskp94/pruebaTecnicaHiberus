import 'package:flutter/material.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:magichiberus/ui/utils/breakpoints.dart';

class DetallesCarta extends StatelessWidget {

  final Carta carta;

  const DetallesCarta({required this.carta});

  //TODO: mover a un widget interno del widget card_list
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimes) {
      if(dimes.maxWidth >= kTabletBreakpoint){
        return bodyDetalles();
      }
      return Scaffold(
        appBar: AppBar(title: Text(carta.name),),
        body: bodyDetalles(),
      );
    });
  }

  Widget bodyDetalles(){
    return Column(
      children: [
        Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Image.network(
              this.carta.imageUrl,
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
        Divider(thickness: 2,),
        Text(this.carta.name),
        Divider(thickness: 2,),
        Text('Setname: $this.carta.set'),
        Divider(thickness: 2,),
        Text('Texto: $this.carta.text'),
      ],
    );
  }
}
