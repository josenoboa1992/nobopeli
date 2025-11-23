import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nobopeli/infrstructure/datasource/moviedb_datasource.dart';
import 'package:nobopeli/infrstructure/repositories/movie_repository_imple.dart';

//este repositorio es inmutable  osea es de solo lectura
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImple(datasource: MoviedbDatasource());
});
