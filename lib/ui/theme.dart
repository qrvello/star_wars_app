import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.notoSansTextTheme(TextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  )),
  primaryColor: Color(0xff355070),
  accentColor: Colors.blue,
  scaffoldBackgroundColor: Color(0xff252a48),
);
