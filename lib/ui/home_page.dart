import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'characters_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      //drawer: _drawer(context),
      body: Stack(
        children: [
          _background(),
          Column(
            children: [
              CharactersGrid(),
              _paginateButtons(),
            ],
          ),
          _bottomNavigationBar(),
        ],
      ),
    );
  }

  Container _paginateButtons() {
    return Container(
      padding: EdgeInsets.only(bottom: 68),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(
                  (states) => EdgeInsets.zero),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return 0;
                } else {
                  return 2;
                }
              }),
              shadowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.grey.withOpacity(0.6)),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.blue.withOpacity(0.3)),
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(
                  (states) => EdgeInsets.zero),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return 0;
                } else {
                  return 2;
                }
              }),
              shadowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.grey.withOpacity(0.6)),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.blue.withOpacity(0.3)),
            ),
            child: Icon(
              Icons.chevron_right_rounded,
              color: Colors.black,
            ),
          ),
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
