import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/repositories/dependency_injection.dart';
import 'package:star_wars_app/ui/home/home_page.dart';
import 'package:star_wars_app/ui/theme.dart';

import 'domain/cubits/bottom_nav_bar_cubit.dart';
import 'domain/cubits/list_charactes_cubit/list_characters_offline_cubit.dart';
import 'domain/cubits/list_charactes_cubit/list_characters_online_cubit.dart';
import 'domain/repositories/database_repository.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositoryProviders,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(
            create: (context) => ListCharactersOnlineCubit(
              context.read<ApiRepository>(),
              context.read<DatabaseRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                ListCharactersOfflineCubit(context.read<DatabaseRepository>()),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Star Wars App',
          theme: theme,
          home: HomePage(),
        ),
      ),
    );
  }
}
