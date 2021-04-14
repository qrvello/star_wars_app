import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/data/api_repository_impl.dart';
import 'package:star_wars_app/data/database_repository_impl.dart';
import 'api_repository.dart';
import 'database_repository.dart';

final List<RepositoryProvider> repositoryProviders = [
  RepositoryProvider<ApiRepository>(create: (_) => ApiRepositoryImpl()),
  RepositoryProvider<DatabaseRepository>(
      create: (_) => DatabaseRepositoryImpl()),
];
