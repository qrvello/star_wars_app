import 'dart:ui';

import 'package:flutter/material.dart';

import 'characters_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      extendBodyBehindAppBar: true,
      drawer: _drawer(context),
      body: Stack(
        children: [
          _background(),
          CharactersGrid(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Home'),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Container _background() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
        ),
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'StarWars App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('Modo Offline'),
            onTap: () {},
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('Modo Online'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
