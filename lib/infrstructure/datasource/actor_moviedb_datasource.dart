import 'package:dio/dio.dart';
import 'package:nobopeli/config/constants/environment.dart';
import 'package:nobopeli/domain/datasources/actor_datasource.dart';
import 'package:nobopeli/domain/entities/actor.dart';
import 'package:nobopeli/infrstructure/mappers/actor_mapper.dart';
import 'package:nobopeli/infrstructure/models/moviesdb/credit_response.dart';

class ActorMoviedbDatasource extends ActorDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {'api_key': Environment.movieKey, 'language': 'es-MX'},
    ),
  );

  @override
  Future<List<Actor>> getActorMovies(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final creditResponse = CreditResponse.fromJson(response.data);
    final List<Actor> actors =
        creditResponse.cast
            .map((cast) => ActorMapper.castToEntity(cast))
            .toList();
    return actors;
  }
}
