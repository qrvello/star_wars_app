import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_cubit.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_state.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name),
      ),
      body: BlocProvider(
        create: (context) =>
            CharacterDetailsCubit(context.read(), character)..init(),
        child: BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
          builder: (context, state) {
            if (state is CharacterDetailsInitial) {
              return Column(
                children: [
                  _buildInitialData(),
                  _buildBuildLoading(),
                ],
              );
            }

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

            return _buildInitialData();
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

  Column _buildInitialData() {
    return Column(children: [
      Text('Color de cabello: ${character.hairColor ?? ''}'),
      Text('Color de piel: ${character.skinColor ?? ''}'),
      Text('Color de ojos: ${character.eyeColor ?? ''}'),
    ]);
  }

  List<Widget> _buildLoadedData(CharacterDetailsLoaded state) {
    return [
      ListTile(
        title: Text('Planeta al que pertenece: ${state.homeworld.name}'),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: state.starships.length ?? 0,
          itemBuilder: (context, i) {
            if (state.starships[i] is! String) {
              Starship starship = state.starships[i];
              return ListTile(
                title: Text(starship.name),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: state.vehicles.length ?? 0,
          itemBuilder: (context, i) {
            if (state.vehicles[i] is! String) {
              Vehicle vehicle = state.vehicles[i];
              return ListTile(
                title: Text(vehicle.name),
              );
            }
            return SizedBox.shrink();
          },
        ),
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
}
