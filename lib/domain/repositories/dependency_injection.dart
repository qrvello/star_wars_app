import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/data/repositories_impl/api_repository_impl.dart';
import 'package:star_wars_app/data/repositories_impl/database_repository_impl.dart';

import 'api_repository.dart';
import 'database_repository.dart';

final List<RepositoryProvider> providers = [
  RepositoryProvider<ApiRepository>(create: (_) => ApiRepositoryImpl()),
  RepositoryProvider<DatabaseRepository>(
      create: (_) => DatabaseRepositoryImpl()),
];
