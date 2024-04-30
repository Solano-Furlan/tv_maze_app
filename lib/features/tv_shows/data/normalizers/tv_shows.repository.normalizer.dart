import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/core/helpers/html.helper.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/episode.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show_schedule.model.dart';

class TvShowsRepositoryNormalizer {
  TvShowsRepositoryNormalizer._();

  static TvShow tvShowFromMap({
    required Map<String, dynamic> mapData,
  }) =>
      TvShow(
        id: (mapData['id'] as int).toString(),
        name: mapData['name'] as String,
        featuredImageUrl: mapData['image']?['medium'] as String? ??
            mapData['image']?['original'] as String? ??
            EnvironmentService.placeHolderImageUrl,
        description: mapData['summary'] == null
            ? null
            : HtmlHelper.removeAllHtmlTags(mapData['summary'] as String),
        genres: mapData['genres'] != null
            ? List<String>.from(mapData['genres'])
            : [],
        premieredAt: mapData['premiered'] == null
            ? null
            : DateTime.parse(
                mapData['premiered'],
              ),
        endedAt: mapData['ended'] == null
            ? null
            : DateTime.parse(
                mapData['ended'],
              ),
        tvShowSchedule: TvShowSchedule(
          time: mapData['schedule']?['time'] as String?,
          days: mapData['schedule']?['days'] != null
              ? List<String>.from(mapData['schedule']?['days'])
              : null,
        ),
        network: mapData['network']?['name'] as String?,
        episodes: const [],
      );

  static Episode episodeFromMap({
    required Map<String, dynamic> mapData,
  }) =>
      Episode(
        id: (mapData['id'] as int).toString(),
        name: mapData['name'] as String,
        description: mapData['summary'] == null
            ? null
            : HtmlHelper.removeAllHtmlTags(mapData['summary'] as String),
        featuredImageUrl: mapData['image']?['medium'] as String? ??
            mapData['image']?['original'] as String? ??
            EnvironmentService.placeHolderImageUrl,
        season: mapData['season'] as int,
        number: mapData['number'] as int,
        airdate: mapData['airdate'] != null
            ? DateTime.tryParse(mapData['airdate'] as String)
            : null,
      );

  static Map<String, dynamic> tvShowToMapData({required TvShow tvShow}) =>
      <String, dynamic>{
        'id': int.parse(tvShow.id),
        'name': tvShow.name,
        'summary': tvShow.description,
        'genres': tvShow.genres,
        'image': {
          'medium': tvShow.featuredImageUrl,
        },
      };
}
