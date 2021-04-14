import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/data/repositories_impl/api_repository_impl.dart';
import 'package:star_wars_app/data/repositories_impl/database_repository_impl.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_offline_cubit.dart';
import 'package:star_wars_app/domain/cubits/list_charactes_cubit/list_characters_online_cubit.dart';

import 'api_repository.dart';
import 'database_repository.dart';

final List<RepositoryProvider> repositoryProviders = [
  RepositoryProvider<ApiRepository>(create: (_) => ApiRepositoryImpl()),
  RepositoryProvider<DatabaseRepository>(
      create: (_) => DatabaseRepositoryImpl()),
];

final List<BlocProvider> cubitsProviders = [
  BlocProvider(create: (context) => BottomNavBarCubit()),
  BlocProvider(
    create: (context) => ListCharactersOnlineCubit(
      context.read<ApiRepository>(),
      context.read<DatabaseRepository>(),
    ),
  ),
  BlocProvider(
    create: (context) => ListCharactersOfflineCubit(
      context.read<DatabaseRepository>(),
    ),
  ),
];
