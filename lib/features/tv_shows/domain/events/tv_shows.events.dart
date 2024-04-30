import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

class FavoriteTvShowAddedEvent extends EventBusMessage {
  FavoriteTvShowAddedEvent({
    required this.tvShow,
  });

  final TvShow tvShow;
}

class FavoriteTvShowRemovedEvent extends EventBusMessage {
  FavoriteTvShowRemovedEvent({
    required this.tvShowId,
  });

  final String tvShowId;
}
