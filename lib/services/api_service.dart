import 'package:dio/dio.dart';
import '../models/character.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://potterapi-fedeperin.vercel.app/en",
    ),
  );

  Future<List<Character>> fetchCharacters() async {
    final response = await _dio.get("/characters");

    List data = response.data;

    return data.map((json) => Character.fromJson(json)).toList();
  }
}