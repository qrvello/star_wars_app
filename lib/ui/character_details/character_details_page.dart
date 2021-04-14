import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_offline_cubit.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_online_cubit.dart';
import 'package:star_wars_app/domain/cubits/character_details_cubit/character_details_state.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';
import 'package:star_wars_app/ui/character_details/widgets/initial_data_widget.dart';
import 'package:star_wars_app/ui/character_details/widgets/loaded_data_widget.dart';
import 'package:star_wars_app/ui/character_details/widgets/report_button_widget.dart';
import 'package:star_wars_app/ui/widgets/custom_error_widget.dart';
import 'package:star_wars_app/ui/widgets/loading_widget.dart';

// ignore: must_be_immutable
class CharacterDetailsPage extends StatelessWidget {
  final Character character = Get.arguments['character'];
  bool online;
  bool submitingReport = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      backgroundColor: Color(0xff293241),
      body: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, index) {
          if (index == 0) {
            online = true;
          } else {
            online = false;
          }

          return SingleChildScrollView(
            child: (online == true)

                // Online
                ? buildOnline()

                //Offline
                : buildOffline(),
          );
        },
      ),
    );
  }

  BlocProvider<CharacterDetailsOfflineCubit> buildOffline() {
    return BlocProvider(
      create: (context) => CharacterDetailsOfflineCubit(
        character,
        context.read<DatabaseRepository>(),
      )..init(),
      child: BlocBuilder<CharacterDetailsOfflineCubit, CharacterDetailsState>(
        builder: (context, state) {
          return _buildData(state, context);
        },
      ),
    );
  }

  BlocProvider<CharacterDetailsOnlineCubit> buildOnline() {
    return BlocProvider(
      create: (context) => CharacterDetailsOnlineCubit(
        character,
        context.read<ApiRepository>(),
        context.read<DatabaseRepository>(),
      )..init(),
      child: BlocBuilder<CharacterDetailsOnlineCubit, CharacterDetailsState>(
        builder: (context, state) {
          return _buildData(state, context);
        },
      ),
    );
  }

  Widget _buildData(CharacterDetailsState state, BuildContext context) {
    if (state is CharacterDetailsLoaded) {
      return Column(
        children: [
          InitialDataWidget(character),
          LoadedDataWidget(state),
          ReportButtonWidget(character),
        ],
      );
    }

    if (state is CharacterDetailsError) {
      return Column(
        children: [
          InitialDataWidget(character),
          CustomErrorWidget(state.message),
        ],
      );
    }

    return Column(
      children: [
        InitialDataWidget(character),
        LoadingWidget(),
        ReportButtonWidget(character),
      ],
    );
  }
}
