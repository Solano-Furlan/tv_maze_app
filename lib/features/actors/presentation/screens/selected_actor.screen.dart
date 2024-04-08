import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/core/design_system/theme/colors.dart';
import 'package:tv_maze_app/core/design_system/widgets/buttons/back_button.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/indicators/error_indicator.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/indicators/loading_indicator.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:tv_maze_app/features/actors/presentation/widgets/selected_actor_content.widget.dart';
import 'package:tv_maze_app/features/actors/state/selected_actor/selected_actor.cubit.dart';
import 'package:tv_maze_app/features/actors/state/selected_actor/selected_actor.state.dart';
import 'package:tv_maze_app/features/tv_shows/state/selected_tv_show/selected_tv_show.cubit.dart';

class SelectedActorScreen extends StatelessWidget {
  const SelectedActorScreen({
    required this.actorId,
    super.key,
  });

  final String actorId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedActorCubit, SelectedActorState>(
      builder: (
        BuildContext context,
        SelectedActorState selectedActorState,
      ) {
        return UIMainScaffold(
          backButton: const UIBackButton(
            color: AppColors.green,
          ),
          body: Builder(
            builder: (BuildContext context) {
              if (selectedActorState is SelectedActorLoadedState) {
                return SelectedActorContent(
                  actor: selectedActorState.actor,
                  tvShows: selectedActorState.tvShows,
                );
              }
              if (selectedActorState is SelectedActorErrorState) {
                return Center(
                  child: UIErrorIndicator(
                    errorText:
                        'Failed to load actor, please check your internet connection.',
                    onPressed: () =>
                        context.read<SelectedTvShowCubit>().getTvShow(
                              tvShowId: actorId,
                            ),
                    color: AppColors.green,
                  ),
                );
              }
              return const Center(
                child: UILoadingIndicator(
                  color: AppColors.green,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
