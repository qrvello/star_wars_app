import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_state.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/ui/character_details/character_details_page.dart';

// ignore: must_be_immutable
class GridViewWidget extends StatelessWidget {
  final ListCharactersLoaded state;
  bool online;
  GridViewWidget(this.state);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, index) {
        if (index == 0) {
          online = true;
        } else {
          online = false;
        }

        return GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.01,
            childAspectRatio: 1.5,
          ),
          shrinkWrap: true,
          itemCount: state.characters.length,
          itemBuilder: (context, i) => itemBuilder(state.characters[i]),
        );
      },
    );
  }

  Container itemBuilder(Character character) {
    return Container(
      margin: EdgeInsets.only(top: 14, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            Color(0xff3d5a80).withOpacity(0.45),
            Color(0xff3d5a80).withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          Get.to(() => CharacterDetailsPage(), arguments: {
            'character': character,
            'online': online,
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              character.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xfffcbf49), fontSize: 18),
            ),
            SizedBox(height: 12),
            (character.height != 'unknown')
                ? Text(
                    'Altura de ${character.height} cm',
                    style: TextStyle(color: Colors.white),
                  )
                : SizedBox.shrink(),
            (character.mass != 'unknown')
                ? Text(
                    'Peso de ${character.mass} kg',
                    style: TextStyle(color: Colors.white),
                  )
                : SizedBox.shrink(),
            (character.gender != 'unknown')
                ? Text(
                    'Género ${character.gender}',
                    style: TextStyle(color: Colors.white),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
