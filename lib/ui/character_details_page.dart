import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';
import 'package:star_wars_app/ui/character_details_cubit.dart';

class CharacterDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Character character = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name),
      ),
      body: BlocProvider(
        create: (context) =>
            CharacterDetailsCubit(context.read(), character)..init(),
        child: BlocBuilder<CharacterDetailsCubit, Character>(
          builder: (context, character) {
            return Column(
              children: [
                Text('Color de cabello: ${character.hairColor ?? ''}'),
                Text('Color de piel: ${character.skinColor ?? ''}'),
                Text('Color de ojos: ${character.eyeColor ?? ''}'),
                (character.homeworld is! String)
                    ? Text(
                        'Planeta al que pertenece: ${character.homeworld.name}')
                    : SizedBox.shrink(),
                Expanded(
                  child: ListView.builder(
                    itemCount: character.starships.length,
                    itemBuilder: (context, i) {
                      if (character.starships[i] is! String) {
                        Starship starship = character.starships[i];
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
                    itemCount: character.vehicles.length,
                    itemBuilder: (context, i) {
                      if (character.vehicles[i] is! String) {
                        Vehicle vehicle = character.vehicles[i];
                        return ListTile(
                          title: Text(vehicle.name),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
