import 'package:nobopeli/domain/datasources/movie_datasource.dart';
import 'package:nobopeli/domain/entities/movie.dart';
import 'package:nobopeli/domain/repositories/movie_repository.dart';

class MovieRepositoryImple extends MovieRepository {
  final MovieDatasource datasource;
  MovieRepositoryImple({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieID(String id) {
    return datasource.getMovieID(id);
  }
}
