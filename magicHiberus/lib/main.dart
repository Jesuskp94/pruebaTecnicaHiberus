import 'package:flutter/material.dart';

import 'package:magichiberus/ui/app.dart';

import 'data/repositories/carta_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(StateApp());

class StateApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartasProvider(), lazy: false,),
      ],
      child: MyApp(),
    );
  }
}