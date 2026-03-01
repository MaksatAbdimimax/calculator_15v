import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'models/character.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final ApiService apiService = ApiService();
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  void loadCharacters() async {
    final data = await apiService.fetchCharacters();
    setState(() {
      characters = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: characters.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return ListTile(
            leading: Image.network(character.image),
            title: Text(
              character.fullName,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              character.house,
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}