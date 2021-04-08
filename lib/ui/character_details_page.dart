import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/models/character.dart';
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocProvider(
                create: (context) =>
                    CharacterDetailsCubit(context.read(), character)..init(),
                child: BlocBuilder<CharacterDetailsCubit, Character>(
                  builder: (context, character) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Color de cabello: ${character.hairColor}'),
                        Text('Color de piel: ${character.skinColor}'),
                        Text('Color de ojos: ${character.eyeColor}'),
                        Text(
                            'Planeta al que pertenece: ${character.homeworld}'),
                        Text('Adasdasd'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
