import 'package:nobopeli/domain/entities/actor.dart';

abstract class ActorDatasource {
  Future<List<Actor>> getActorMovies(String movieId);
}
