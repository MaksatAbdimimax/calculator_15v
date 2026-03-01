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

  List<HarryModel> characters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  Future<void> getHttp() async {
    final box = Hive.box<HarryModel>('harryBox');

    // если данные уже есть — берем из Hive
    if (box.isNotEmpty) {
      setState(() {
        characters = box.values.toList();
        isLoading = false;
      });
      return;
    }

    // если Hive пуст — грузим из API
    final response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/characters');

    final List<dynamic> rawList = response.data;

    final list = rawList
        .map((e) => HarryModel.fromJson(e as Map<String, dynamic>))
        .toList();

    // сохраняем
    await box.addAll(list);

    setState(() {
      characters = list;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Harry Characters")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];

          return ListTile(
            leading: Image.network(character.image ?? ""),
            title: Text(character.fullName ?? "No name"),
            subtitle: Text(character.hogwartsHouse ?? "No house"),
          );
        },
      ),
    );
  }
}