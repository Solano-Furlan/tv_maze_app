import 'package:equatable/equatable.dart';
import 'package:tv_maze_app/features/actors/domain/actor.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

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

  final IActor actor;
  final List<ITvShow> tvShows;

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
