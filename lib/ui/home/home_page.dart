import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../buttom_nav_cubit.dart';
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
      body: BlocProvider(
        create: (context) => BottomNavCubit(),
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (BuildContext context, int index) => Stack(
            children: [
              _background(),
              CharactersGrid(index: index),
              _bottomNavigationBar(context, index),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element_
  Positioned _bottomNavigationBar(BuildContext context, int index) {
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
          currentIndex: index,
          onTap: (int value) {
            switch (value) {
              case 0:
                context.read<BottomNavCubit>().updateIndex(0);
                break;
              case 1:
                context.read<BottomNavCubit>().updateIndex(1);
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
      title: Text(
        'Lista de personajes',
        style: GoogleFonts.openSans(
            color: Color(0xfffcbf49), fontWeight: FontWeight.w700),
      ),

      //flexibleSpace: Container(
      //  decoration: BoxDecoration(
      //    gradient: LinearGradient(
      //      colors: [
      //        Color(0xff003049).withOpacity(0.9),
      //        Color(0xff223049).withOpacity(0.5),
      //      ],
      //      begin: Alignment.topLeft,
      //      end: Alignment.bottomRight,
      //    ),
      //  ),
      //),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Container _background() {
    return Container(
      //color: Color(0xff252a48),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff252a48),
          Color(0xff252a48).withOpacity(0.8),
        ],
      )),
      //  image: DecorationImage(
      //    image: AssetImage('assets/background.jpg'),
      //    fit: BoxFit.cover,
      //  ),
      //),
      //child: BackdropFilter(
      //  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      //  child: Container(),
      //),
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
