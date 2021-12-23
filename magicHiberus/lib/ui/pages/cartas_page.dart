import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magichiberus/data/providers/cartas_provider.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class CardsPage extends StatefulWidget{
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  int _posicionActual = 0;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }


  @override
  Widget build(BuildContext context) {

    //TODO: cambiarlo por una apariencia más cuqui
    if(_connectionStatus == ConnectivityResult.none){
      print('No hay internet');
      return Center(child: Text('Sin internet'),);
    }else{
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
                      SizedBox(height: 10,),
                      dotIndicator(snapshot.data!.length)
                    ],
                  ),
                );
              },
            ),
          )
      );
    }
  }

  Widget dotIndicator(int length) => AnimatedSmoothIndicator(
    activeIndex: _posicionActual,
    count: length,
    effect: ScrollingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.grey,
        activeDotColor: Colors.green),
  );

  List<Widget> _crearListaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> cartas = [];
    Widget widgetTemporal;
    data!.forEach((element) {
      Carta carta = element;
      if (carta.imageUrl.isEmpty){
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
      }else{
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