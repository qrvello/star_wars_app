import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_offline_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_online_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_state.dart';
import 'package:star_wars_app/ui/characters_grid/grid_view_widget.dart';
import 'package:star_wars_app/ui/characters_grid/paginate_buttons_widget.dart';
import 'package:star_wars_app/ui/widgets/custom_error_widget.dart';
import 'package:star_wars_app/ui/widgets/loading_widget.dart';

// ignore: must_be_immutable
class CharactersGrid extends StatelessWidget {
  bool online;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, int index) {
        if (index == 0) {
          online = true;
          // Modo online
          return buildGridOnline(context);
        } else {
          online = false;

          // Modo offline
          return buildGridOffline(context);
        }
      },
    );
  }

  BlocBuilder buildGridOnline(BuildContext context) {
    BlocProvider.of<ListCharactersOnlineCubit>(context)..init();

    return BlocBuilder<ListCharactersOnlineCubit, ListCharactersState>(
      builder: _buildGrid,
    );
  }

  BlocBuilder buildGridOffline(BuildContext context) {
    BlocProvider.of<ListCharactersOfflineCubit>(context)..init();

    return BlocBuilder<ListCharactersOfflineCubit, ListCharactersState>(
      builder: _buildGrid,
    );
  }

  Widget _buildGrid(BuildContext context, ListCharactersState state) {
    // Está cargando
    if (state is ListCharactersLoading) {
      return LoadingWidget();
    }

    // Terminó de cargar
    if (state is ListCharactersLoaded) {
      return Container(
        margin: EdgeInsets.only(bottom: 65),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridViewWidget(state),
              // Si esta en modo online muestra los botones para cambiar de página
              (online) ? PaginateButtonsWidget() : SizedBox.shrink(),
            ],
          ),
        ),
      );
    }

    // Error
    if (state is ListCharactersError) {
      return CustomErrorWidget(state.message);
    }

    return Container();
  }
}
