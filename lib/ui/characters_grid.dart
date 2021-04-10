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

          return Column(
            children: [
              _charactersGridView(context),
              _paginateButtons(),
            ],
          );
        },
      ),
    );
  }

  Expanded _charactersGridView(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width > 1900) ? 3 : 2,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.01,
          childAspectRatio:
              (MediaQuery.of(context).size.height > 1200) ? 2.5 : 1.7,
        ),
        padding: EdgeInsets.only(bottom: 5, top: 80),
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
                Get.to(() => CharacterDetailsPage(), arguments: characters[i]);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    characters[i].name,
                    style: TextStyle(color: Color(0xfffcbf49), fontSize: 18),
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
}
