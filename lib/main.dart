import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';
import 'app.dart';
import 'domain/models/character.dart';
import 'domain/models/planet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory appDocumentDir = await getApplicationDocumentsDirectory();

  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(CharacterAdapter())
    ..registerAdapter(StarshipAdapter())
    ..registerAdapter(VehicleAdapter())
    ..registerAdapter(PlanetAdapter());

  await Hive.openBox<Character>('characters');
  await Hive.openBox<Starship>('starships');
  await Hive.openBox<Vehicle>('vehicles');
  await Hive.openBox<Planet>('planets');

  runApp(MyApp());
}
