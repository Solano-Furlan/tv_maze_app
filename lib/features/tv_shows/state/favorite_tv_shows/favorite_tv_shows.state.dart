import 'package:equatable/equatable.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

abstract class FavoriteTvShowsState extends Equatable {}

class FavoriteTvShowsLoadingState extends FavoriteTvShowsState {
  @override
  List<Object?> get props => [];
}

class FavoriteTvShowsLoadedState extends FavoriteTvShowsState {
  FavoriteTvShowsLoadedState({
    required this.tvShows,
    required this.tvShowsLength,
  });

  final List<TvShow> tvShows;
  final int tvShowsLength;

  @override
  List<Object?> get props => [
        tvShows,
        tvShowsLength,
      ];
}

class FavoriteTvShowsErrorState extends FavoriteTvShowsState {
  @override
  List<Object?> get props => [];
}
