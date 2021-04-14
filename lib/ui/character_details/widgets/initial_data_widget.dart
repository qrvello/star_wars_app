import 'package:flutter/material.dart';
import 'package:star_wars_app/domain/models/character.dart';

import 'card_widget.dart';

class InitialDataWidget extends StatelessWidget {
  const InitialDataWidget(this.character);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (character.hairColor != ("n\a"))
            ? CardWidget('Color de cabello', trailing: character.hairColor)
            : null,
        CardWidget('Color de ojos', trailing: character.eyeColor),
        CardWidget('Color de piel', trailing: character.skinColor),
      ],
    );
  }
}
