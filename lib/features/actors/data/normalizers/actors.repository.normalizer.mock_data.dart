import 'package:tv_maze_app/features/actors/data/normalizers/actors.repository.normalizer.dart';
import 'package:tv_maze_app/features/actors/domain/actor.interface.dart';

class ActorsRepositoryMockData {
  ActorsRepositoryMockData._();

  static const actorsMapData = <Map<String, dynamic>>[
    {
      'id': 1,
      'url': 'https://www.tvmaze.com/people/1/mike-vogel',
      'name': 'Mike Vogel',
      'country': {
        'name': 'United States',
      },
      'birthday': '1979-07-17',
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/0/1815.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/0/1815.jpg'
      },
    },
    {
      'id': 2,
      'name': 'Rachelle Lefevre',
      'country': {
        'name': 'Canada',
      },
      'birthday': '1979-02-01',
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/82/207417.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/82/207417.jpg'
      },
    },
    {
      'id': 3,
      'name': 'Alexander Koch',
      'country': {
        'name': 'United States',
      },
      'birthday': '1988-02-24',
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/205/513325.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/205/513325.jpg'
      },
    },
  ];

  static final List<IActor> actors = actorsMapData
      .map((Map<String, dynamic> mapData) =>
          ActorsRepositoryNormalizer.actorFromMap(mapData: mapData))
      .toList();
}
