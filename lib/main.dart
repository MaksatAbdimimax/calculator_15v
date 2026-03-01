import 'package:calculator_15v/data/harry_screen.dart';
import 'package:flutter/material.dart';
import 'calculator_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HarryModelAdapter());

  await Hive.openBox<HarryModel>('harryBox');

  runApp(const MyApp());
}