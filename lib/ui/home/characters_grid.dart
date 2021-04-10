import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_state.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';

import '../buttom_nav_cubit.dart';
import '../character_details/character_details_page.dart';

// ignore: must_be_immutable
class CharactersGrid extends StatelessWidget {
  List<Character> characters;
  final int index;

  CharactersGrid({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return BlocProvider(
        create: (context) => ListCharactersCubit(context.read<ApiRepository>())
          ..init('https://swapi.dev/api/people/.json'),
        child: BlocBuilder<ListCharactersCubit, ListCharactersState>(
          builder: (context, state) {
            if (state is ListCharactersLoading) {
              return buildLoading(context);
            }

            if (state is ListCharactersLoaded) {
              return _charactersGridView(context, state);
            }

            if (state is ListCharactersError) {
              return buildError(state);
            }

            return Container();
          },
        ),
      );
    } else {
      return Center(
        child: Text('hola'),
      );
    }
  }

  Center buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildError(ListCharactersError error) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Color(0xffE45D68),
            size: 40,
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE45D68),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              error.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Column _charactersGridView(BuildContext context, ListCharactersLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).size.width > 1900) ? 3 : 2,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.01,
              childAspectRatio:
                  (MediaQuery.of(context).size.height > 1200) ? 2.5 : 1.7,
            ),
            padding: EdgeInsets.only(bottom: 5, top: 80),
            itemCount: state.characters.length,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.07),
                      Colors.white.withOpacity(0.3),
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
                      elevation: MaterialStateProperty.resolveWith((states) =>
                          (states.contains(MaterialState.pressed) ? 2 : 5)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {
                    Get.to(() => CharacterDetailsPage(),
                        arguments: state.characters[i]);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        state.characters[i].name,
                        style:
                            TextStyle(color: Color(0xfffcbf49), fontSize: 18),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Altura de ${state.characters[i].height ?? ''} cm',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Peso de ${state.characters[i].mass ?? ''} kg',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Género ${state.characters[i].gender ?? ''}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        _paginateButtons(context, state),
      ],
    );
  }

  Container _paginateButtons(BuildContext context, ListCharactersLoaded state) {
    return Container(
      padding: EdgeInsets.only(bottom: 68),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          (state.previousUrl != '')
              ? previousButton(context, state.previousUrl)
              : Container(),
          (state.nextUrl != '')
              ? nextButton(context, state.nextUrl)
              : Container(),
        ],
      ),
    );
  }

  ElevatedButton previousButton(BuildContext context, String url) {
    return ElevatedButton(
      onPressed: () {
        context.read<ListCharactersCubit>()..init(url);
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
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
        Icons.chevron_left_rounded,
        color: Colors.black,
      ),
    );
  }

  ElevatedButton nextButton(BuildContext context, String url) {
    return ElevatedButton(
      onPressed: () async {
        context.read<ListCharactersCubit>()..init(url);
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
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
        Icons.chevron_right_rounded,
        color: Colors.black,
      ),
    );
  }
}
