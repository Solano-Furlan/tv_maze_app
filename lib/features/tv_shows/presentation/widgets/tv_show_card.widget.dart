import 'package:flutter/widgets.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({
    required this.tvShow,
    super.key,
  });

  final ITvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
