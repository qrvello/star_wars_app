import 'package:flutter/material.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_state.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';

import 'card_widget.dart';

class LoadedDataWidget extends StatelessWidget {
  final CharacterDetailsLoaded state;

  const LoadedDataWidget(this.state);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (state.character.homeworld is Planet)
            ? CardWidget(state.character.homeworld.name)
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
              return CardWidget(starship.name, subtitle: starship.model);
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
              return CardWidget(vehicle.name, subtitle: vehicle.model);
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class Planet {}
