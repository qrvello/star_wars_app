import 'package:star_wars_app/domain/models/character.dart';

abstract class ListCharactersState {
  ListCharactersState();
}

class ListCharactersInitial extends ListCharactersState {}

class ListCharactersLoading extends ListCharactersState {}

class ListCharactersError extends ListCharactersState {
  final String message;
  ListCharactersError(this.message);
}

class ListCharactersLoaded extends ListCharactersState {
  ListCharactersLoaded(this.characters, {this.nextUrl, this.previousUrl});
  final List<Character> characters;
  final String previousUrl;
  final String nextUrl;
}
