import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'characters_grid.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  bool online = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      //drawer: _drawer(context),
      body: Stack(
        children: [
          _background(),
          CharactersGrid(),
          _bottomNavigationBar(),
        ],
      ),
    );
  }

  // ignore: unused_element
  Positioned _bottomNavigationBar() {
    return Positioned(
      left: 5,
      right: 5,
      bottom: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Online',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_off),
              label: 'Offline',
            ),
          ],
          onTap: (int value) {
            switch (value) {
              case 0:
                online = true;
                break;

              case 1:
                online = false;
                break;
            }
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lista de personajes',
            style: GoogleFonts.openSans(
              color: Color(0xfffcbf49),
            ),
          ),
          Text('Página 1'),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff003049).withOpacity(0.9),
              Color(0xff223049).withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      //backgroundColor: Colors.transparent,
      //shadowColor: Colors.transparent,
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
        child: Container(),
      ),
    );
  }

  // ignore: unused_element
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
            title: Text('Modo Offline'),
            onTap: () {},
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            title: Text('Modo Online'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
