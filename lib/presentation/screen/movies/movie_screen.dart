import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';
  final String moviedID;

  const MovieScreen({super.key, required this.moviedID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Movied:$moviedID')));
  }
}
