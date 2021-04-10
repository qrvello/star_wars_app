import 'package:equatable/equatable.dart';
import 'package:star_wars_app/domain/models/character.dart';

abstract class ListCharactersState {
  const ListCharactersState();
}

class ListCharactersInitial extends ListCharactersState {
  const ListCharactersInitial();
}

class ListCharactersLoading extends ListCharactersState {
  const ListCharactersLoading();
}

class ListCharactersError extends ListCharactersState {
  final String message;
  ListCharactersError(this.message);
}

class ListCharactersLoaded extends ListCharactersState {
  const ListCharactersLoaded(this.characters, this.nextUrl, this.previousUrl);
  final List<Character> characters;
  final String previousUrl;
  final String nextUrl;
  List<Object> get props => [characters, previousUrl, nextUrl];
}
