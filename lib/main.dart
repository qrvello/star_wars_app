import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/ui/home/home_page.dart';

import 'data/repositories/api_repository_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ApiRepository>(
      create: (_) => ApiRepositoryImpl(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
          primaryColor: Color(0xff355070),
          accentColor: Colors.blue,
          scaffoldBackgroundColor: Color(0xff355070).withOpacity(0.8),
        ),
        home: HomePage(),
      ),
    );
  }
}
