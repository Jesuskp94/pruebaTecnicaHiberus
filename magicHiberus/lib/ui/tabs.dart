import 'package:flutter/material.dart';

import 'package:magichiberus/ui/pages/home_page.dart';
import 'package:magichiberus/ui/pages/cartas_page.dart';
import 'package:magichiberus/ui/widgets/scaffold_adaptativo.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  final _tabsController = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _tabsController,
      builder: (context, index, child) => AdaptiveScaffold(
        tabs: [
          TabItem(
            title: 'Home',
            iconData: Icons.person,
            body: HomePage(),
          ),
          TabItem(
            title: 'Cartas',
            iconData: Icons.library_books,
            body: CardsPage(),
          ),
        ],
        selectedIndex: index,
        onSelectionChanged: (val) => _tabsController.value = val,
      ),
    );
  }
}