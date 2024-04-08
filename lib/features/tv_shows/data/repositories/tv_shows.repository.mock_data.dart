import 'package:tv_maze_app/features/tv_shows/data/normalizers/tv_shows.repository.normalizer.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/episode.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

class TvShowsResposityMockData {
  TvShowsResposityMockData._();

  static const List<Map<String, dynamic>> tvShowsMapData =
      <Map<String, dynamic>>[
    {
      'id': 1,
      'name': 'Under the Dome',
      'genres': ['Drama', 'Science-Fiction', 'Thriller'],
      'premiered': '2013-06-24',
      'ended': '2015-09-10',
      'schedule': {
        'time': '22:00',
        'days': ['Thursday']
      },
      'network': {
        'name': 'CBS',
      },
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg'
      },
      'summary':
          '<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town\'s inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>',
    },
    {
      'id': 2,
      'name': 'Person of Interest',
      'genres': ['Action', 'Crime', 'Science-Fiction'],
      'premiered': '2011-09-22',
      'ended': '2016-06-21',
      'schedule': {
        'time': '22:00',
        'days': ['Tuesday']
      },
      'rating': {'average': 8.8},
      'weight': 98,
      'network': {
        'name': 'CBS',
      },
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/163/407679.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/163/407679.jpg'
      },
      'summary':
          '<p>You are being watched. The government has a secret system, a machine that spies on you every hour of every day. I know because I built it. I designed the Machine to detect acts of terror but it sees everything. Violent crimes involving ordinary people. People like you. Crimes the government considered \'irrelevant\'. They wouldn\'t act so I decided I would. But I needed a partner. Someone with the skills to intervene. Hunted by the authorities, we work in secret. You\'ll never find us. But victim or perpetrator, if your number is up, we\'ll find you.</p>',
    },
    {
      'id': 3,
      'name': 'Bitten',
      'genres': ['Drama', 'Horror', 'Romance'],
      'status': 'Ended',
      'premiered': '2014-01-11',
      'ended': '2016-04-15',
      'schedule': {
        'time': '22:00',
        'days': ['Friday']
      },
      'network': {
        'name': 'CTV Sci-Fi Channel',
      },
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/0/15.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/0/15.jpg'
      },
      'summary':
          '<p>Based on the critically acclaimed series of novels from Kelley Armstrong. Set in Toronto and upper New York State, <b>Bitten</b> follows the adventures of 28-year-old Elena Michaels, the world\'s only female werewolf. An orphan, Elena thought she finally found her \'happily ever after\' with her new love Clayton, until her life changed forever. With one small bite, the normal life she craved was taken away and she was left to survive life with the Pack.</p>',
    },
  ];

  static const List<Map<String, dynamic>> episodesMap = <Map<String, dynamic>>[
    {
      'id': 1,
      'name': 'Pilot',
      'season': 1,
      'number': 1,
      'airdate': '2013-06-24',
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg'
      },
      'summary':
          '<p>When the residents of Chester\'s Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>',
    },
    {
      'id': 2,
      'name': 'The Fire',
      'season': 1,
      'number': 2,
      'airdate': '2013-07-01',
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_landscape/1/4389.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/1/4389.jpg'
      },
      'summary':
          '<p>While the residents of Chester\'s Mill face the uncertainty of life in the dome, panic is heightened when a house goes up in flames and their fire department is outside of the dome.</p>',
    },
    {
      'id': 3,
      'name': 'Manhunt',
      'season': 1,
      'number': 3,
      'airdate': '2013-07-08',
      'image': {
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_landscape/1/4390.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/1/4390.jpg'
      },
      'summary':
          '<p>When a former deputy goes rogue, Big Jim recruits Barbie to join the manhunt to keep the town safe. Meanwhile, Junior is determined to escape the dome by going underground.</p>',
    },
  ];

  static final List<ITvShow> tvShows = tvShowsMapData
      .map((Map<String, dynamic> mapData) =>
          TvShowsRepositoryNormalizer.tvShowFromMap(mapData: mapData))
      .toList();

  static final List<IEpisode> episodes = episodesMap
      .map((Map<String, dynamic> mapData) =>
          TvShowsRepositoryNormalizer.episodeFromMap(mapData: mapData))
      .toList();
}
