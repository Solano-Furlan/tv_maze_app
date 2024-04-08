import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/local_tv_shows.repository.dart';
import 'package:tv_maze_app/features/tv_shows/domain/events/tv_shows.events.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';
import 'package:tv_maze_app/features/tv_shows/state/favorite_tv_shows_crud/favorite_tv_shows_crud.state.dart';

class FavoriteTvShowsCrudCubit extends Cubit<FavoriteTvShowsCrudState> {
  FavoriteTvShowsCrudCubit({
    required this.localTvShowsRepository,
    required this.eventBus,
  }) : super(FavoriteTvShowsCrudInitialState());

  final LocalTvShowsRepository localTvShowsRepository;
  final EventBus eventBus;

  Future<FavoriteTvShowsCrudState> addFavoriteTvShow({
    required ITvShow tvShow,
  }) async {
    try {
      emit(FavoriteTvShowsCrudLoadingState());

      await localTvShowsRepository.addFavoriteTvShow(
        tvShow: tvShow,
      );

      eventBus.fire(FavoriteTvShowAddedEvent(tvShow: tvShow));

      emit(FavoriteTvShowsCrudAddedState());
      return state;
    } catch (_) {
      emit(FavoriteTvShowsCrudErrorState());
      return state;
    }
  }

  Future<FavoriteTvShowsCrudState> removeFavoriteTvShow({
    required String tvShowId,
  }) async {
    try {
      emit(FavoriteTvShowsCrudLoadingState());

      await localTvShowsRepository.remodeFavoriteTvShow(
        tvShowId: tvShowId,
      );

      eventBus.fire(FavoriteTvShowRemovedEvent(tvShowId: tvShowId));

      emit(FavoriteTvShowsCrudRemovedState());
      return state;
    } catch (_) {
      emit(FavoriteTvShowsCrudErrorState());
      return state;
    }
  }
}
