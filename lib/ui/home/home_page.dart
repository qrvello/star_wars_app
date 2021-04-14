import 'package:flutter/material.dart';
import 'package:star_wars_app/ui/home/widgets/background.dart';
import 'package:star_wars_app/ui/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:star_wars_app/ui/home/widgets/drawer_widget.dart';
import '../characters_grid/characters_grid.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  bool online = true;

  @override
  Widget build(BuildContext context) {
    // Inyecta el cubit el bottom navigation bar
    return Scaffold(
      appBar: AppBar(title: Text('Lista de personajes')),
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: Stack(
        children: [
          Background(),
          CharactersGrid(),
          BottomNavigationBarWidget(),
        ],
      ),
    );
  }
}
