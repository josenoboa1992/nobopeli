import 'package:flutter_riverpod/legacy.dart';

class MovieMapNotifier extends StateNotifier {
  MovieMapNotifier() : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
  }
}
