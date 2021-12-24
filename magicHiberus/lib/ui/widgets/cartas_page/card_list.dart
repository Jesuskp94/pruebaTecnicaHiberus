import 'package:flutter/material.dart';
import 'package:magichiberus/data/providers/cartas_provider.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:magichiberus/ui/utils/breakpoints.dart';
import 'package:magichiberus/ui/widgets/cartas_page/card_details.dart';
import 'package:provider/provider.dart';

class ListaCartas extends StatefulWidget {
  @override
  State<ListaCartas> createState() => _ListaCartasState();
}

class _ListaCartasState extends State<ListaCartas> {

  final _selection = ValueNotifier<Carta>(Carta.dumydata());

  @override
  Widget build(BuildContext context) {

    final cartasProvider = Provider.of<CartasProvider>(context);

    return FutureBuilder(
      initialData: [],
      future: cartasProvider.getAllCartas(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return LayoutBuilder(builder: (context, dimes) {
          if(dimes.maxWidth >= kTabletBreakpoint){
            const kListViewWidth = 300.0;
            return Row(
              children: [
                Container(
                  width: kListViewWidth,
                  child: buildListView((val){
                    _selection.value = val;
                  }, snapshot.data),
                ),
                VerticalDivider(width: 0),
                Expanded(
                  child: ValueListenableBuilder<Carta>(
                    valueListenable: _selection,
                    builder: (context, carta, child) {
                      if (carta.name.isEmpty) {
                        return Center(child: Text('No has seleccionado ninguna darta'));
                      }
                      return DetallesCarta(carta: carta);
                    },
                  )
                )
              ],
            );
          }else{
            return buildListView((val){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetallesCarta(carta: val),
                ),
              );
            }, snapshot.data);
          }
        });
      },
    );
  }

  Widget buildListView(ValueChanged<Carta> onSelect, List<dynamic>? data) {
    if(data != null){
      if(data.isNotEmpty){
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 0),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final _carta = data.elementAt(index);
            return ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text(_carta.name),
              onTap: () => onSelect(_carta),
            );
          },
        );
      }
    }
    return Center(child: Text('No hay cartas'),);
  }
}