import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/models/character.dart';

import 'character_details_page.dart';
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
          characters = snapshot;

          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
              ),
              padding: EdgeInsets.only(bottom: 5, top: 70),
              itemCount: characters.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff003049).withOpacity(0.9),
                        Color(0xff003049).withOpacity(0.5),
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
                      elevation: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return 2;
                        } else {
                          return 5;
                        }
                      }),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    onPressed: () {
                      Get.to(CharacterDetailsPage(), arguments: characters[i]);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          characters[i].name,
                          style:
                              TextStyle(color: Color(0xfffcbf49), fontSize: 18),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Altura de ${characters[i].height ?? ''} cm',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Peso de ${characters[i].mass ?? ''} kg',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Género ${characters[i].gender ?? ''}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
