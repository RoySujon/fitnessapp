import 'dart:convert';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class Api extends ChangeNotifier {
  String link =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2dcq-xBH13wH4pKR7VYlEy3NMWcU9cL5ySVNtCyvY9YiTNNQI54x-kT-M';
  List<Exercises> allData = [];
  late Exercises exercises;
  int? x;

  fetchData() async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body)["exercises"];
      for (var data in decode) {
        exercises = Exercises(
          id: data['id'],
          title: data['title'],
          gif: data['gif'],
          seconds: data['seconds'],
          thumbnail: data['thumbnail'],
        );
        allData.add(exercises);
        notifyListeners();
      }
    }
  }
}
