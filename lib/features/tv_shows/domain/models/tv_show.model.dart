import 'package:equatable/equatable.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/episode.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show_schedule.model.dart';

class TvShow extends Equatable {
  const TvShow({
    required this.id,
    required this.name,
    required this.featuredImageUrl,
    required this.description,
    required this.genres,
    required this.premieredAt,
    required this.endedAt,
    required this.network,
    required this.tvShowSchedule,
    required this.episodes,
  });

  final String id;
  final String name;
  final String featuredImageUrl;
  final String? description;
  final List<String> genres;
  final DateTime? premieredAt;
  final DateTime? endedAt;
  final String? network;
  final TvShowSchedule? tvShowSchedule;
  final List<Episode> episodes;

  TvShow copyWith({
    List<Episode>? episodes,
  }) =>
      TvShow(
        id: id,
        name: name,
        featuredImageUrl: featuredImageUrl,
        description: description,
        genres: genres,
        premieredAt: premieredAt,
        endedAt: endedAt,
        network: network,
        tvShowSchedule: tvShowSchedule,
        episodes: episodes ?? this.episodes,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        featuredImageUrl,
        description,
        genres,
        premieredAt,
        endedAt,
        network,
        tvShowSchedule,
        episodes,
      ];
}
