import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/key.dart';
import '../components/SearchBar.dart';

Future<List> fetchnews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=${Key.key}&q=${SearchBar.searchbarcontroller.text}'));
  Map result = jsonDecode(response.body);
  print('recieved');
  return result['articles'];
}
