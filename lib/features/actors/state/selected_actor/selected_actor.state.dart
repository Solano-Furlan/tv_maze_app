import 'package:equatable/equatable.dart';
import 'package:tv_maze_app/features/actors/domain/models/actor.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

abstract class SelectedActorState extends Equatable {}

class SelectedActorLoadingState extends SelectedActorState {
  @override
  List<Object?> get props => [];
}

class SelectedActorLoadedState extends SelectedActorState {
  SelectedActorLoadedState({
    required this.actor,
    required this.tvShows,
  });

  final Actor actor;
  final List<TvShow> tvShows;

  @override
  List<Object?> get props => [
        actor,
        tvShows,
      ];
}

class SelectedActorErrorState extends SelectedActorState {
  @override
  List<Object?> get props => [];
}
