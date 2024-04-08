import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/features/actors/data/data/actors.repository.dart';
import 'package:tv_maze_app/features/actors/domain/actor.interface.dart';
import 'package:tv_maze_app/features/actors/state/selected_actor/selected_actor.state.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

class SelectedActorCubit extends Cubit<SelectedActorState> {
  SelectedActorCubit({
    required this.cloudTvShowsRepository,
    required this.actorsRepository,
  }) : super(SelectedActorLoadingState());

  final ActorsRepository actorsRepository;
  final CloudTvShowsRepository cloudTvShowsRepository;

  Future<void> getActor({
    required String actorId,
  }) async {
    try {
      emit(SelectedActorLoadingState());

      final IActor actor = await actorsRepository.getActor(
        actorId: actorId,
      );

      final List<ITvShow> tvShows =
          await cloudTvShowsRepository.getActorTvShows(
        actorId: actorId,
      );

      emit(SelectedActorLoadedState(
        actor: actor,
        tvShows: tvShows,
      ));
    } catch (_, __) {
      emit(SelectedActorErrorState());
    }
  }
}
