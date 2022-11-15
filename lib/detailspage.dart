import 'package:fitnessapp/api.dart';
import 'package:fitnessapp/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.index, required this.exercises});
  final int index;
  final Exercises? exercises;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Api>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          provider.allData[index].title.toString(),
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Image.network(provider.allData[index].gif.toString())),
          // Expanded(child: Placeholder()),
          // Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
