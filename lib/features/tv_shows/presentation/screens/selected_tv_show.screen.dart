import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/core/design_system/theme/colors.dart';
import 'package:tv_maze_app/core/design_system/widgets/buttons/back_button.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/indicators/error_indicator.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/indicators/loading_indicator.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:tv_maze_app/features/tv_shows/presentation/widgets/tv_show_content.widget.dart';
import 'package:tv_maze_app/features/tv_shows/state/selected_tv_show/selected_tv_show.cubit.dart';
import 'package:tv_maze_app/features/tv_shows/state/selected_tv_show/selected_tv_show.state.dart';

class SelectedTvShowScreen extends StatelessWidget {
  const SelectedTvShowScreen({
    required this.tvShowId,
    super.key,
  });

  final String tvShowId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTvShowCubit, SelectedTvShowState>(builder: (
      BuildContext context,
      SelectedTvShowState selectedTvShowState,
    ) {
      return UIMainScaffold(
        backButton: const UIBackButton(
          color: AppColors.primary,
        ),
        body: Builder(
          builder: (BuildContext context) {
            if (selectedTvShowState is SelectedTvShowLoadedState) {
              return TvShowContent(
                tvShow: selectedTvShowState.tvShow,
              );
            }
            if (selectedTvShowState is SelectedTvShowErrorState) {
              return Center(
                child: UIErrorIndicator(
                  errorText:
                      'Failed to load tv show, please check your internet connection.',
                  onPressed: () =>
                      context.read<SelectedTvShowCubit>().getTvShow(
                            tvShowId: tvShowId,
                          ),
                ),
              );
            }
            return const Center(
              child: UILoadingIndicator(),
            );
          },
        ),
      );
    });
  }
}
