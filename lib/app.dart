import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:star_wars_app/ui/home/home_page.dart';
import 'package:star_wars_app/ui/theme.dart';

import 'data/repositories_impl/api_repository_impl.dart';
import 'data/repositories_impl/database_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/database_repository.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepository>(create: (_) => ApiRepositoryImpl()),
        RepositoryProvider<DatabaseRepository>(
            create: (_) => DatabaseRepositoryImpl()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData,
        home: HomePage(),
      ),
    );
  }
}
