import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/models/character.dart';

import 'character_details.dart';
import 'list_characters_cubit.dart';

// ignore: must_be_immutable
class CharactersGrid extends StatelessWidget {
  List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCharactersCubit(context.read())..init(),
      child: BlocBuilder<ListCharactersCubit, List<Character>>(
        builder: (context, snapshot) {
          if (snapshot != []) {
            characters = snapshot;
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: characters.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.all(7.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff161A31).withOpacity(0.9),
                        Color(0xff161A31).withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CharacterDetails()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          characters[i].name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Altura de ${characters[i].height} cm',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Peso de ${characters[i].mass} kg',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Género ${characters[i].gender}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
