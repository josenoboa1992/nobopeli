import 'package:flutter_riverpod/legacy.dart';
import 'package:nobopeli/domain/entities/actor.dart';
import 'package:nobopeli/presentation/providers/actors/actor_repository_provider.dart';

final actorByMovieProvider =
    StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>((
      ref,
    ) {
      final actorsRepository = ref.watch(actorRepositoryProvider);
      return ActorByMovieNotifier(actorsRepository.getActorMovies);
    });

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieID);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActors;
  ActorByMovieNotifier(this.getActors) : super({});
  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
