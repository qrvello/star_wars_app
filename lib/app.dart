import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:star_wars_app/domain/repositories/dependency_injection.dart';
import 'package:star_wars_app/ui/home/home_page.dart';
import 'package:star_wars_app/ui/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: providers,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Star Wars App',
        theme: theme,
        home: HomePage(),
      ),
    );
  }
}
