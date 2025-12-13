import 'package:nobopeli/domain/entities/actor.dart' as actor_entity;
import 'package:nobopeli/infrstructure/models/moviesdb/credit_response.dart';

class ActorMapper {
  static actor_entity.Actor castToEntity(Cast cast) => actor_entity.Actor(
    id: cast.id,
    name: cast.name,
    character: cast.character ?? '',
    profilePath:
        cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://i.stack.imgur.com/GNhxO.png',
  );
}
