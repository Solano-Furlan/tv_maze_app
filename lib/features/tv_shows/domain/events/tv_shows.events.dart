import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

class FavoriteTvShowAddedEvent extends EventBusMessage {
  FavoriteTvShowAddedEvent({
    required this.tvShow,
  });

  final ITvShow tvShow;
}

class FavoriteTvShowRemovedEvent extends EventBusMessage {
  FavoriteTvShowRemovedEvent({
    required this.tvShowId,
  });

  final String tvShowId;
}
