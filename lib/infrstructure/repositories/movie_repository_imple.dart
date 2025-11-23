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
}
