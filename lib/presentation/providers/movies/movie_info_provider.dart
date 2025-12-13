import 'package:flutter_riverpod/legacy.dart';
import 'package:nobopeli/domain/entities/movie.dart';
import 'package:nobopeli/presentation/providers/movies/movies_repository_provider.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
      final movieRepository = ref.watch(movieRepositoryProvider);

      return MovieMapNotifier(movieRepository.getMovieID);
    });

typedef GetMovieCallBack = Future<Movie> Function(String movieID);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;
  MovieMapNotifier(this.getMovie) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
