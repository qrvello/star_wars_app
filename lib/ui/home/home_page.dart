import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/cubits/buttom_nav_cubit.dart';
import '../characters_grid/characters_grid.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  bool online = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      //drawer: _drawer(context),
      body: BlocProvider(
        create: (context) => BottomNavCubit(),
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (BuildContext context, int index) {
            return Stack(
              children: [
                _background(),
                CharactersGrid(),
                _bottomNavigationBar(context, index),
              ],
            );
          },
        ),
      ),
    );
  }

  Positioned _bottomNavigationBar(BuildContext context, int index) {
    return Positioned(
      left: 5,
      right: 5,
      bottom: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xfffcbf49),
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              tooltip: 'Encuentra los personajes a través de internet',
              icon: Icon(Icons.cloud),
              label: 'Online',
            ),
            BottomNavigationBarItem(
              tooltip:
                  'Encuentra los personajes que están guardados localmente en tu celular',
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
      backgroundColor: Color(0xff252a48),
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
          Color(0xff252a48).withOpacity(0.9),
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
