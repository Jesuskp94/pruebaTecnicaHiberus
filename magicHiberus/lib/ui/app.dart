import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magichiberus/ui/tabs.dart';
import 'dart:developer' as developer;

class MyApp extends StatefulWidget {
  static final String titulo = "Magic Hiberus";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TODO: convertir a un service própiamente dicho
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
    if(_connectionStatus == ConnectivityResult.none) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MyApp.titulo,
        home: Scaffold(
          appBar: AppBar(title: Text('No internet',),backgroundColor: Colors.green,),
          body: Column(
            children: [
              _showDialog(context,title: 'Connection error', msg: 'Actulamente no tienes internet, la aplicación no va a funcionar correctamente'),
            ]
          ),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MyApp.titulo,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: TabHome(),
      );
    }
  }
  AlertDialog _showDialog(BuildContext context, {String? title, String? msg}) {
    return AlertDialog(
      title: Text('$title'),
      content: Text('$msg'),
    );
  }
}