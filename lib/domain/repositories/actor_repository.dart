import 'package:nobopeli/domain/entities/actor.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorMovies(String movieId);
}
