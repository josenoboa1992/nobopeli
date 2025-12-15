import 'package:nobopeli/domain/datasources/actor_datasource.dart';
import 'package:nobopeli/domain/entities/actor.dart';
import 'package:nobopeli/domain/repositories/actor_repository.dart';

class ActorRepositoryImple extends ActorRepository {
  final ActorDatasource datasource;
  ActorRepositoryImple(this.datasource);

  @override
  Future<List<Actor>> getActorMovies(String movieId) {
    return datasource.getActorMovies(movieId);
  }
}
