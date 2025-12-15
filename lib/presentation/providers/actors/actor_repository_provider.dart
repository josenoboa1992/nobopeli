import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nobopeli/domain/repositories/actor_repository.dart';
import 'package:nobopeli/infrstructure/datasource/actor_moviedb_datasource.dart';
import 'package:nobopeli/infrstructure/repositories/actor_repository_imple.dart';

final actorRepositoryProvider = Provider<ActorRepository>((ref) {
  return ActorRepositoryImple(ActorMoviedbDatasource());
});
