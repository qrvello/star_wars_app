import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_offline_cubit.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_online_cubit.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_state.dart';

import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/planet.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character = Get.arguments['character'];

  final bool online = Get.arguments['online'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: GoogleFonts.openSans(
              color: Color(0xfffcbf49), fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color(0xff252a48),
      ),
      body: (online == true)
          ? BlocProvider(
              create: (context) => CharacterDetailsOnlineCubit(
                  character,
                  context.read<ApiRepository>(),
                  context.read<DatabaseRepository>())
                ..init(),
              child: BlocBuilder<CharacterDetailsOnlineCubit,
                  CharacterDetailsState>(
                builder: (context, state) {
                  return SingleChildScrollView(child: _buildData(state));
                },
              ),
            )
          : BlocProvider(
              create: (context) => CharacterDetailsOfflineCubit(
                  character, context.read<DatabaseRepository>())
                ..init(),
              child: BlocBuilder<CharacterDetailsOfflineCubit,
                  CharacterDetailsState>(
                builder: (context, state) {
                  return SingleChildScrollView(child: _buildData(state));
                },
              ),
            ),
    );
  }

  _buildBuildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildInitialData() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.25),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Card(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: ListTile(
              tileColor: Colors.transparent,
              trailing: Text(
                character.hairColor,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              title: Text(
                'Color de cabello',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.25),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Card(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: ListTile(
              trailing: Text(
                character.eyeColor,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              tileColor: Colors.transparent,
              title: Text('Color de ojos'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.25),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Card(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: ListTile(
              trailing: Text(
                character.skinColor,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              tileColor: Colors.transparent,
              title: Text('Color de piel'),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildLoadedData(CharacterDetailsLoaded state) {
    return [
      (state.character.homeworld is Planet)
          ? Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.25),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  trailing: Text(
                    character.homeworld.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  tileColor: Colors.transparent,
                  title: Text(
                    'Planeta del que proviene',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
      (state.character.starships.length > 0)
          ? Container(
              margin: EdgeInsets.all(12),
              child: Text(
                'Naves estelares',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          : SizedBox.shrink(),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.character.starships.length,
        itemBuilder: (context, i) {
          if (state.character.starships[i] is Starship) {
            Starship starship = state.character.starships[i];
            return Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.25),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  tileColor: Colors.transparent,
                  title: Text(starship.name),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
      (state.character.vehicles.length > 0)
          ? Container(
              margin: EdgeInsets.all(12),
              child: Text(
                'Vehículos',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          : SizedBox.shrink(),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.character.vehicles.length,
        itemBuilder: (context, i) {
          if (state.character.vehicles[i] is Vehicle) {
            Vehicle vehicle = state.character.vehicles[i];
            return Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.25),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  tileColor: Colors.transparent,
                  title: Text(vehicle.name),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    ];
  }

  Widget _buildError(CharacterDetailsError error) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Color(0xffE45D68),
            size: 40,
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE45D68),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              error.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildData(CharacterDetailsState state) {
    if (state is CharacterDetailsLoaded) {
      return Column(
        children: [
          _buildInitialData(),
          ..._buildLoadedData(state),
        ],
      );
    }

    if (state is CharacterDetailsError) {
      return Column(
        children: [
          _buildInitialData(),
          _buildError(state),
        ],
      );
    }

    return Column(
      children: [
        _buildInitialData(),
        _buildBuildLoading(),
      ],
    );
  }
}
