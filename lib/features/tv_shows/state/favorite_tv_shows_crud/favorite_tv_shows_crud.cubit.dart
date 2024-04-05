import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/local_tv_shows.repository.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';
import 'package:tv_maze_app/features/tv_shows/state/favorite_tv_shows_crud/favorite_tv_shows_crud.state.dart';

class FavoriteTvShowsCrudCubit extends Cubit<FavoriteTvShowsCrudState> {
  FavoriteTvShowsCrudCubit({
    required this.localTvShowsRepository,
  }) : super(FavoriteTvShowsCrudLoadingState());

  final LocalTvShowsRepository localTvShowsRepository;

  Future<void> addFavoriteTvShow({
    required ITvShow tvShow,
  }) async {
    try {
      emit(FavoriteTvShowsCrudLoadingState());

      await localTvShowsRepository.addFavoriteTvShow(
        tvShow: tvShow,
      );

      emit(FavoriteTvShowsCrudAddedState());
    } catch (_) {
      emit(FavoriteTvShowsCrudErrorState());
    }
  }

  Future<void> removeFavoriteTvShow({
    required String tvShowId,
  }) async {
    try {
      emit(FavoriteTvShowsCrudLoadingState());

      await localTvShowsRepository.remodeFavoriteTv(
        tvShowId: tvShowId,
      );

      emit(FavoriteTvShowsCrudRemovedState());
    } catch (_) {
      emit(FavoriteTvShowsCrudErrorState());
    }
  }
}
