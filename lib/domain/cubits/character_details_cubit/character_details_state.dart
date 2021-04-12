import 'package:star_wars_app/domain/models/character.dart';

abstract class CharacterDetailsState {
  CharacterDetailsState();
}

class CharacterDetailsInitial extends CharacterDetailsState {}

class CharacterDetailsLoading extends CharacterDetailsState {}

class CharacterDetailsError extends CharacterDetailsState {
  final String message;

  CharacterDetailsError(this.message);
}

class CharacterDetailsLoaded extends CharacterDetailsState {
  final Character character;

  CharacterDetailsLoaded(this.character);
}
