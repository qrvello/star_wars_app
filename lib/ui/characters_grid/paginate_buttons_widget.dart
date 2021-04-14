import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_online_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_state.dart';

class PaginateButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCharactersOnlineCubit, ListCharactersState>(
      builder: (context, state) {
        debugPrint(state.toString());
        if (state is ListCharactersLoaded) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (state.previousUrl != '')
                    ? _buildButton(context, state.previousUrl, 'left')
                    : Container(),
                (state.nextUrl != '')
                    ? _buildButton(context, state.nextUrl, 'right')
                    : Container(),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  ElevatedButton _buildButton(
      BuildContext context, String url, String direction) {
    return ElevatedButton(
      onPressed: () =>
          context.read<ListCharactersOnlineCubit>()..init(url: url),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        primary: Colors.white,
        onPrimary: Color(0xfffcbf49),
      ),
      child: Icon(
        (direction == 'left')
            ? Icons.chevron_left_rounded
            : Icons.chevron_right_rounded,
        color: Color(0xff293241),
      ),
    );
  }
}
