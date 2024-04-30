import 'package:equatable/equatable.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

abstract class SelectedTvShowState extends Equatable {}

class SelectedTvShowLoadingState extends SelectedTvShowState {
  @override
  List<Object?> get props => [];
}

class SelectedTvShowLoadedState extends SelectedTvShowState {
  SelectedTvShowLoadedState({
    required this.tvShow,
    required this.isFavorite,
  });

  final TvShow tvShow;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        tvShow,
        isFavorite,
      ];
}

class SelectedTvShowErrorState extends SelectedTvShowState {
  @override
  List<Object?> get props => [];
}
