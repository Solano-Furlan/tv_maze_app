import 'package:flutter/material.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/core/design_system/theme/colors.dart';
import 'package:tv_maze_app/core/design_system/widgets/cards/label_card.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/texts/header_text.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:tv_maze_app/core/helpers/date.helper.dart';
import 'package:tv_maze_app/core/navigation/services/navigation.service.dart';
import 'package:tv_maze_app/features/actors/domain/actor.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';
import 'package:tv_maze_app/features/tv_shows/presentation/widgets/tv_show_card.widget.dart';

class SelectedActorContent extends StatelessWidget {
  const SelectedActorContent({
    required this.actor,
    required this.tvShows,
    super.key,
  });

  final IActor actor;
  final List<ITvShow> tvShows;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildHeader(
          actor: actor,
        ),
        const SizedBox(height: 20),
        _buildInfo(
          actor: actor,
        ),
        const SizedBox(height: 20),
        _buildActorTvShows(
          tvShows: tvShows,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHeader({
    required IActor actor,
  }) =>
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.dark1,
          image: DecorationImage(
            image: NetworkImage(
              actor.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black.withOpacity(.35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 160),
              UIText(
                actor.name,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 1.0,
                    color: AppColors.black.withOpacity(.8),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );

  Widget _buildInfo({
    required IActor actor,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Builder(builder: (BuildContext context) {
          if (actor.country == null && actor.birthday == null) {
            return const UIHeaderText(
              'No Personal Info Available',
              fontSize: 22,
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIHeaderText('Personal Info'),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  if (actor.country != null)
                    UILabelCard(
                      backgroundColor: AppColors.green,
                      text: 'Country: ${actor.country!}',
                      fontSize: 14,
                      verticalPadding: 6,
                      horizontalPadding: 12,
                    ),
                  if (actor.birthday != null)
                    UILabelCard(
                      backgroundColor: AppColors.green,
                      text:
                          'Age: ${DateHelper.calculateAge(actor.birthday!)} Years',
                      fontSize: 14,
                      verticalPadding: 6,
                      horizontalPadding: 12,
                    ),
                ],
              ),
            ],
          );
        }),
      );

  Widget _buildActorTvShows({
    required List<ITvShow> tvShows,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Builder(builder: (BuildContext context) {
          if (tvShows.isEmpty) {
            return const UIHeaderText(
              'No Tv Shows Available',
              fontSize: 22,
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIHeaderText(
                'Tv Shows',
              ),
              const SizedBox(height: 20),
              ...List.generate(
                  tvShows.length,
                  (index) => TvShowCard(
                        tvShow: tvShows[index],
                        onPressed: () =>
                            getIt<AppNavigationService>().routeToSelectedTvShow(
                          tvShowId: tvShows[index].id,
                        ),
                      ))
            ],
          );
        }),
      );
}
