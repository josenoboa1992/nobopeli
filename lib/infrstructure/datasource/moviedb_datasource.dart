import 'package:dio/dio.dart';
import 'package:nobopeli/config/constants/environment.dart';
import 'package:nobopeli/domain/datasources/movie_datasource.dart';
import 'package:nobopeli/domain/entities/movie.dart';
import 'package:nobopeli/infrstructure/mappers/movie_mapper.dart';
import 'package:nobopeli/infrstructure/models/moviesdb/movie_detail.dart';
import 'package:nobopeli/infrstructure/models/moviesdb/moviedb_response.dart';

class MoviedbDatasource extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {'api_key': Environment.movieKey, 'language': 'es-MX'},
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final moviesDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        moviesDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    final moviesDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        moviesDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    final moviesDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        moviesDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );
    final moviesDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        moviesDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<Movie> getMovieID(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Error al cargar el movie con id $id');
    }
    final movieDetail = MovieDetail.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetail);
    return movie;
  }
}
