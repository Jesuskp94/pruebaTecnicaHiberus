import 'package:flutter/material.dart';
import 'package:magichiberus/ui/tabs.dart';

class MyApp extends StatelessWidget {
  static final String titulo = "Magic Hiberus";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titulo,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: TabHome(),
    );
  }
}