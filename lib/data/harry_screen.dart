import 'package:calculator_15v/data/harry_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HarryScreen extends StatefulWidget {
  const HarryScreen({super.key});

  @override
  State<HarryScreen> createState() => _HarryScreenState();
}

class _HarryScreenState extends State<HarryScreen> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    getHttp();
   return Scaffold();
  }

  Future<List<HarryModel>> getHttp() async {
    final response = await dio.get('https://potterapi-fedeperin.vercel.app/en/characters');

    final List<dynamic> rawList = response.data;
    final List<HarryModel> list = rawList
        .map((e) => HarryModel.fromJson(e as  Map <String, dynamic>))
        .toList();
    response.data;

    return  list;
  }

}
