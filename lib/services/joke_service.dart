import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:quote_and_joke/models/joke_models.dart';

final dadJokeProvider = FutureProvider.autoDispose((ref) async {
  final jokeService = JokeService();

  return jokeService.getDadJoke();
});

class JokeService {
  JokeSingle dadJoke = JokeSingle(text: "Nothing yet!");

  Future<JokeSingle> getDadJoke() async {
    final http.Response response = await http.get("https://icanhazdadjoke.com/",
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      dadJoke = JokeSingle(text: decode["joke"]);
      print(dadJoke.text);
    } else {
      dadJoke = JokeSingle(
        text: "No internet connection :(",
      );
    }
    return dadJoke;
  }
}
